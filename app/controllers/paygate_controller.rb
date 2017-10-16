class PaygateController < ApplicationRenderController
  before_action :set_user, only: [:payform, :gateway, :create]
  before_action :set_web_product, only: [:payform, :gateway]
  before_action :find_web_product, only: [:create]
  before_action :gateway_params, only: [:gateway]
  before_action :set_ip

  # 결제 신청화면
  def payform
    if @user.nil? or @web_product.nil?
      response = {
          errors: {
              id: :unprocessable_entity,
              status: 422,
              title: "찾을 수 없는 #{@user.nil? ? "회원정보" : ""} #{@user.nil? && @web_product.nil? ? "와" : ''} #{@web_product.nil? ? "상품정보" : ""}를 요청하셨습니다. (문제가 있다면 슬링 개발팀으로 연락주세요)"
          }
      }.to_json

      render json: response, status: 422
    elsif already_purchased(@user, @web_product)
      response = {
          errors: {
              id: :unprocessable_entity,
              status: 422,
              title: '이미 결제 및 신청이 완료된 상품입니다. (문제가 있다면 슬링 개발팀으로 연락주세요)'
          }
      }.to_json

      render json: response, status: 422
    else
      render :payform
    end
  end

  # PG 결제 프로세스 시작
  def gateway
    @req = gateway_params # JSON from Client ( required informations for pg process )
    render :gateway
  end

  # PG 결제 처리 후 콜백 처리
  def create
    Rails.logger.info "AstroError = Paygate process has been done but unknown server error for paygate_params: #{paygate_params}" and return if @web_product.nil? or @user.nil?

    sling = SlingIamport.new(@user, @web_product, paygate_params)
    @web_purchase = sling.approve #결제 승인처리 ( 사용자가 조작된 금액으로 결제를 했으면 서버에서 튕겨내기 위한 목적)

    if @web_purchase.nil?
      Rails.logger.info "AstroError = user : #{@user.id}, product : #{@web_product.id} product 결제에러 발생, PG사로 부터 정상적인 결제 승인이 이루어지지 않았습니다."
      render nothing: true, status: :unprocessable_entity
    else
      if @web_purchase.save
        render json: @web_purchase, status: 200
      else
        Rails.logger.info "AstroError = user : #{@user.id}, product : #{@web_product.id} product 결제에러 발생, 결제가 승인되었으나, 내부 서버 에러로인해 완전한 처리가 이루어지지 않았습니다."
        render nothing: true, status: :unprocessable_entity
      end
    end
  end

  private

    def set_ip
      @ip = ENV['SLING_EC2_IP'] || 'http://localhost:3000'
    end

    def set_user
      if params[:key] or params[:paygate][:key]
        @user = User.find_by_key(params[:key] || params[:paygate][:key])
      else
        @user = nil
      end
    end

    def set_web_product
      if params[:group_id]
        group = Group.find_by_id(params[:group_id])
        return unless group
        @web_product = group.web_product
        @picture = @web_product.product.group_detail.pic.url(:xhdpi_4by3)
      elsif params[:spot_id]
        spot = Spot.find_by_id(params[:spot_id])
        return unless spot
        @web_product = spot.web_product
        @picture = @web_product.product.spot_detail.pic.url(:xhdpi_4by3)
      else
        nil
      end
    end

    def find_web_product
      if params[:paygate][:product_id]
        @web_product = WebProduct.find(params[:paygate][:product_id])
      else
        nil
      end
    end

    def gateway_params
      params.require(:paygate).permit(:key, :product_id, :pg, :pay_method, :merchant_uid, :product_name, :amount, :buyer_email, :buyer_tel, :buyer_name, :buyer_addr, :buyer_postcode)
    end

    def paygate_params
      params.require(:paygate).permit(:imp_uid, :merchant_uid, :imp_success)
    end

    # use only if given PG requires different redirection process
    # Parameters: {"imp_uid"=>"imp_725476179142", "merchant_uid"=>"merchant_1495532476174", "imp_success"=>"true"}
    def mobile_paygate_params
      params.permit(:key, :imp_uid, :merchant_uid, :imp_success)
    end

    def mobile_user_params
      params.permit(:key)
    end

    def already_purchased(user, web_product)
      return true if web_product.product.users.exists?(user.id) # 그룹이나 스팟에 이미 들어가 있으면 구입한걸로 본다. ( 매니저가 임의로 넣어주었을 경우 포함 )
      return true if user.web_purchases.pluck(:web_product_id).include?(web_product.id) # 유저가 모임을 구입한 기록이 남아있을경우
      false
    end

end

class PaygateController < Member::ApplicationController
  before_action :set_web_product, only: [:payform, :gateway]
  before_action :find_web_product, only: [:create]
  before_action :set_ip

  # 결제 신청화면
  def payform
    if @web_product.nil?
      response = {
          errors: {
              id: :unprocessable_entity,
              status: 422,
              title: "찾을 수 없는 #{@web_product.nil? ? "상품정보" : ""}를 요청하셨습니다. (문제가 있다면 슬링 개발팀으로 연락주세요)"
          }
      }.to_json

      render json: response, status: 422
    elsif already_purchased(current_user, @web_product)
      response = {
          errors: {
              id: :unprocessable_entity,
              status: 422,
              title: '이미 결제 및 신청이 완료된 상품입니다. (문제가 있다면 슬링 개발팀으로 연락주세요)'
          }
      }.to_json

      render json: response, status: 422

      # spots_controller 에서 확인한건데 더블 체크하는 거임
    elsif @web_product.product.full?
      response = {
          errors: {
              id: :unprocessable_entity,
              status: 422,
              title: '이미 최대 신청 가능 인원이 초과되었습니다. (문제가 있다면 슬링 개발팀으로 연락주세요)'
          }
      }.to_json

      render json: response, status: 422

    else
      render :payform
    end
  end

  # PG 결제 처리 후 콜백 처리
  def create
    Rails.logger.info "AstroError = No product found for : #{paygate_params}" and return if @web_product.nil?

    sling = SlingIamport.new(current_user, @web_product, paygate_params)
    @web_purchase = sling.approve #결제 승인처리 ( 사용자가 조작된 금액으로 결제를 했으면 서버에서 튕겨내기 위한 목적)

    if @web_purchase.nil?
      Rails.logger.info "AstroError = user : #{current_user.id}, product : #{@web_product.id} product 결제에러 발생, PG사로 부터 정상적인 결제 승인이 이루어지지 않았습니다."
      render nothing: true, status: :unprocessable_entity
    elsif @web_purchase.save
      render json: @web_purchase
    else
      Rails.logger.info "AstroError = user : #{current_user.id}, product : #{@web_product.id} product 결제에러 발생, 결제가 승인되었으나, 내부 서버 에러로인해 완전한 처리가 이루어지지 않았습니다."
      render nothing: true, status: :unprocessable_entity
    end
  end

  private

  def set_ip
    @ip = 'http://192.168.0.3:3000'
    @ip = "https://#{ENV['SLING_EC2_DOMAIN']}" if Rails.env == 'production'
  end

  def paygate_params
    params.require(:paygate).permit(:imp_uid, :merchant_uid, :result, :spot_id, :group_id)
  end

  def set_web_product
    if params[:group_id]
      group = Group.find_by_id(params[:group_id])
      return unless group
      @web_product = group.web_product
    elsif params[:spot_id]
      spot = Spot.find_by_id(params[:spot_id])
      return unless spot
      @web_product = spot.web_product
    end
  end

  def find_web_product
    @web_product = WebProduct.find(params[:paygate][:product_id])
  end

  def already_purchased(user, web_product)
    return true if web_product.product.paid_users.include?(user) # 그룹이나 스팟에 이미 들어가 있으면 구입한걸로 본다. ( 매니저가 임의로 넣어주었을 경우 포함 )
    return true if user.web_purchases.pluck(:web_product_id).include?(web_product.id) # 유저가 모임을 구입한 기록이 남아있을경우
    false
  end

end

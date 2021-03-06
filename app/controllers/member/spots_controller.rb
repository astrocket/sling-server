class Member::SpotsController < Member::ApplicationController
  before_action :set_spot, only: [:show, :my_index_show, :join]

  # GET /spots
  # 참여하지 않은 스팟들 다 보여주기
  def index
    @spots = Spot.index(current_user).paginate(:page => params[:page], :per_page => 5) # 나중에 추천 알고리즘

    render json: @spots
  end

  # GET /spots/1
  # 스팟 보여주기, 보고나서 그 안에서 버튼이 존재 해야 하는데, role 별로 분개됨.
  # member => 신청 누르면 구독으로 보낸다.
  # prime
  #   paid : false => 신청누르면 결제창으로 보내버린다. GET /paygate/payform?spot_id=2&key=ejislfjsfalj
  #   paid : true  => 신청버튼자체가 보이지 않는다. -> TODO 나중에 이사람들 하루 전날에 push 알림 날아오도록 개발 해야함
  def show
    authorize [:member, @spot]

    render json: @spot, serializer: SpotSampleSerializer
  end

  # GET /member/spots/my_index
  # 내가 신청한 스팟만 보인다. 스팟은 무조건 결제를 해야지만 신청이 되는게 맞다.
  def my_index
    @spots = Spot.my_index(current_user)

    render json: @spots
  end

  # 모든 걸 싹 보게 해준다.
  # prime.paid == false => 누르면 웹 결제로 보낸다.
  # prime.paid == true => 다보기
  def my_index_show
    authorize [:member, @spot] #이렇게 부르면 policy 에서 record[1] 로 꺼내야 object 를 받을 수 있다.

    render json: @spot, serializer: SpotUnitSerializer # 이미 유저가 가입 된 그룹 일 경우에 연관 데이터 전체를 뿌린다. 이 속에는 정회원이 된 그룹과, 아닌 그룹이 혼재한다. 정회원이 아닌 그룹의 경우 정회원만 할 수 있는 액션을 취할 경우에 앱단에서 결제창으로 리디렉션 시켜야 한다.
  end

  #prime 만 그룹에 조인 가능
  # 그룹의 경우에는 조인 => 결제 가 나뉜다.
  def join
    authorize [:member, @spot]

    if @spot.paid_users.include?(current_user)
      response = {
          errors: {
              id: :unprocessable_entity,
              status: 422,
              title: '이미 신청이 완료 된 스팟 입니다. (문제가 있다면 슬링 개발팀으로 연락주세요)'
          }
      }.to_json

      render json: response, status: 422
    elsif @spot.full?
      response = {
          errors: {
              id: :unprocessable_entity,
              status: 422,
              title: '이미 최대 신청 가능 인원이 초과되었습니다. (문제가 있다면 슬링 개발팀으로 연락주세요)'
          }
      }.to_json

      render json: response, status: 422
    else
      ## 유저의 동시 신청문제를 해결하기 위해서 여기에서 일종의 펜딩상태를 만들어야 함 5분 안으로 결제가이루어지지 않으면 pending이 무효화 되도록 해야한다.
      response = {
          paygate: {
              product_id: @spot.web_product.id
          }
      }

      render json: response
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot
      @spot = Spot.find(params[:id])
    end

end

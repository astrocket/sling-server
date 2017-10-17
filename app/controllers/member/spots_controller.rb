class Member::SpotsController < Member::ApplicationController
  before_action :set_spot, only: [:show, :join]

  # GET /spots
  # 참여하지 않은 스팟들 다 보여주기
  def index
    @spots = Spot.where.not(id: current_user.spots.ids) # 나중에 추천 알고리즘

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

    render json: @spot, serializer: SpotUnitSerializer
  end

  # GET /member/spots/my_index
  # 내가 신청한 스팟만 보인다. 스팟은 무조건 결제를 해야지만 신청이 되는게 맞다.
  def my_index
    @spots = current_user.spots

    render json: @spots
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot
      @spot = Spot.find(params[:id])
    end

end

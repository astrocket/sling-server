class Member::SpotsController < Member::ApplicationController
  before_action :set_spot, only: [:show]

  # GET /spots
  def index
    @spots = Spot.all # 나중에 추천 알고리즘

    render json: @spots
  end

  def my_index
    @spots = current_user.spots

    render json: @spots
  end

  # GET /spots/1
  def show
    authorize [:member, @spot]

    render json: @spot, serializer: SpotUnitSerializer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot
      @spot = Spot.find(params[:id])
    end

end

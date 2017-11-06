class Member::ActivitiesController < Member::ApplicationController
  before_action :set_group, only: [:index]
  before_action :set_activity, only: [:show, :join]

  # GET /activities
  def index
    @activities = @group.activities # 여긴 추천 필요 X 해당 그룹내에서 열린 활동을 싹 불러줌

    render json: @activities
  end

  def my_index
    @activities = current_user.activities

    render json: @activities
  end

  # GET /activities/1
  def show
    # authorize [:member, @activity]

    render json: @activity, serializer: ActivityUnitSerializer
  end

  def join
    authorize [:member, @activity]

    @activity.users << current_user

    render json: @activity, serializer: ActivityUnitSerializer
  end

  private

    def set_group
      @group = Group.find(params[:group_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

end

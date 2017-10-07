class Member::GroupsController < Member::ApplicationController
  before_action :set_group, only: [:show]

  # GET /member/groups
  def index
    @groups = policy_scope([:member, Group])

    render json: @groups
  end

  # GET /member/groups/1
  def show
    authorize [:member, @group]

    render json: @group
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

end

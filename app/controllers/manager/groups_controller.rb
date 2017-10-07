class Manager::GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]

  # GET /manager/groups
  def index
    @groups = policy_scope([:manager, Group])

    render json: @groups
  end

  # GET /manager/groups/1
  def show
    authorize [:manager, @group]

    render json: @group
  end

  # POST /manager/groups
  def create
    @group = Group.new(group_params)
    authorize [:manager, @group]

    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /manager/groups/1
  def update
    authorize [:manager, @group]

    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /manager/groups/1
  def destroy
    authorize [:manager, @group]

    @group.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

  # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(:user_id, :name, :category, :premium)
    end

end

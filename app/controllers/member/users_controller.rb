class Member::UsersController < Member::ApplicationController

  def show
    if params[:member_id]
      @user = User.find params[:member_id]

      render json: @user, serializer: UserShowSerializer
    elsif params[:manager_id]
      @user = User.find params[:manager_id]

      render json: @user, serializer: ManagerShowSerializer
    else
      @user = current_user

      render json: @user, serializer: UserShowSerializer
    end
  end

end

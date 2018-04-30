class Api::V1::GroupsUsersController < ApplicationController

  skip_before_action :authorized

  def index
    @groups_users = GroupsUser.all
    render json: @groups_users
  end

  def create
    @groups_user = GroupsUser.create(groups_user_params)
    @group = Group.find(params[:groups_user][:group_id])
    @user = User.find(params[:groups_user][:user_id])
    render json: @group.users
  end

  def show
    @groups_user = GroupsUser.find(params[:id])
    render json: @groups_user
  end

  def destroy
    @groups_user = GroupsUser.find(params[:id])
    @groups_user.destroy
  end


  private

  def groups_user_params
    params.require(:groups_user).permit(:user_id, :group_id)
  end

end

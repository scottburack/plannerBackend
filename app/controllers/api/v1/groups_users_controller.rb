class Api::V1::GroupsUsersController < ApplicationController

  skip_before_action :authorized

  def index
    @groups_users = GroupsUser.all
    render json: @groups_users
  end

  def create
    @groups_user = GroupsUser.create(event_params)
  end

  def show
    @groups_user = GroupsUser.find(params[:id])
    render json: @groups_user
  end

  def destroy
    @groups_user = GroupsUser.find(params[:id])
    @groups_user.destroy
  end

  def getUserGroups
    @user = User.find(id: params[:user_id])
    @user_groups = GroupsUser.where(user_id: @user.id)
    @group_ids = @user_groups.map {|ug| ug.group_id}
    @groups = Group.all.find_all {|group| @group_ids.include?(group.id)}
    render json: @groups
  end

  private

  def event_params
    params.require(:groups_user).permit(:user_id, :group_id, :username)
  end

end

class Api::V1::GroupsController < ApplicationController

  skip_before_action :authorized


  def index
    @groups = Group.all
    render json: @groups
  end

  def create
    @group = Group.create(group_params)
    @user = User.find_by(username: params[:group][:creator_username])
    GroupsUser.create(group_id: @group.id, user_id: @user.id)
    @user_groups = GroupsUser.where(user_id: @user.id)
    @group_ids = @user_groups.map {|ug| ug.group_id}
    @groups = Group.all.find_all {|group| @group_ids.include?(group.id)}
    render json: @groups
  end

  def show
    @group = Group.find(params[:id])
    render json: @group
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
  end



  private

  def group_params
    params.require(:group).permit(:creator_username, :name, :url_link)
  end

end

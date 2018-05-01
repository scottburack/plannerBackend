class Api::V1::GroupsController < ApplicationController

  skip_before_action :authorized


  def index
    @groups = Group.all
    render json: @groups
  end

  def create
    @group = Group.create(group_params)
    @user = User.find(params[:group][:user_id])
    GroupsUser.create(group_id: @group.id, user_id: @user.id)
    # @user_groups = GroupsUser.where(user_id: @user.id)
    # @group_ids = @user_groups.map {|ug| ug.group_id}
    # @groups = Group.all.find_all {|group| @group_ids.include?(group.id)}
    render json: @user.groups
  end

  def show
    @group = Group.find(params[:id])
    byebug
    render json: @group.users
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
  end

  # def get_users
  #   @group = Group.find(params[:id])
  #   render json: @group.users
  # end


  private

  def group_params
    params.require(:group).permit(:user_id, :name, :url_link)
  end

end

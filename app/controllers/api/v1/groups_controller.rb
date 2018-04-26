class Api::V1::GroupsController < ApplicationController

  skip_before_action :authorized


  def index
    @groups = Group.all
    render json: @groups
  end

  def create
    @group = Group.create(group_params)
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

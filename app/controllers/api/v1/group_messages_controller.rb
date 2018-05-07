class Api::V1::GroupMessagesController < ApplicationController

  skip_before_action :authorized

  def index
    @group_messages = GroupMessage.all
    render json: @group_messages
  end

  def create
    @group_message = GroupMessage.create(group_message_params)
    @group = Group.find(params[:group_message][:group_id])
    @group.group_messages << @group_message
    # byebug
    render json: @group_message
  end

  def show
    @group_message = GroupMessage.find(params[:id])

    render json: @group_message
  end

  def destroy
    @group_message = GroupMessage.find(params[:id])
    @group_message.destroy
  end

  def get_messages
    @group_messages = GroupMessage.where(group_id: params[:group_id])

    render json: @group_messages
  end


  private

  def group_message_params
    params.require(:group_message).permit(:content, :group_id, :sender_username)
  end

end

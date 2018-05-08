class Api::V1::ConversationsController < ApplicationController

  skip_before_action :authorized

  def index
    # @users = User.all
    @conversations = Conversation.all
    render json: @conversations
  end

  def create
  
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversations_params)
    end

    render json: @conversation
  end

  private

  def conversations_params
    params.permit(:sender_id, :recipient_id)
  end



end

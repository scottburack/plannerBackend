class Api::V1::MessagesController < ApplicationController

  skip_before_action :authorized

  before_action do
   @conversation = Conversation.find(params[:conversation_id])

  end

  def index
    @messages = @conversation.messages
    # byebug
    # if @messages.length > 10
    #   @over_ten = true
    #   @messages = @messages[-10..-1]
    # end
    #
    # if params[:m]
    #  @over_ten = false
    #  @messages = @conversation.messages
    # end
    #
    # if @messages.last
    #   if @messages.last.user_id != @current_user.id
    #     @messages.last.read = true;
    #   end
    # end

    # @message = @conversation.messages.new
    render json: @messages
 end

 def create
   @message = Message.create(message_params)
   @convo = Conversation.find(params[:conversation_id])
   @user = User.find(params[:user_id])
   @convo.messages << @message
   @user.conversations << @convo
   render json: @message
 end

 private
  def message_params
    params.require(:message).permit(:body, :user_id, :conversation_id)
  end


end

class ConversationsController < ApplicationController
  before_action :authenticate_user!
  def index
     @users = User.all
     @conversations = Conversation.all
  end

  def create
    if Conversation.between(current_user.id, params[:user_id]).present?
      @conversation = Conversation.between(current_user.id, params[:user_id]).first
    else
      @conversation = Conversation.create!(worker_id: current_user.id, manager_id: params[:user_id])
    end
     redirect_to user_conversation_messages_path(current_user, @conversation)
  end

  private

  def conversation_params
    params.permit(:worker_id, :manager_id)
  end
end

class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end
    @message = Message.new
    end

    def create
    @message = Message.new(message_params)
    @message.conversation_id = params[:conversation_id]
    @message.user = current_user
      if @message.save!
        redirect_to user_conversation_messages_path(current_user, @conversation)
      end
    end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end

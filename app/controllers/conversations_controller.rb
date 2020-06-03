class ConversationsController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.manager
      @placements = Placement.where(id: current_user.managed_placements.ids)
      @users = @placements.map{ |placement| placement.user }
      @conversations = Conversation.where(placement_id: current_user.managed_placements.ids)
    else
      @placements = Placement.where(id: current_user.placements.ids)
      @users = @placements.map{ |placement| placement.project.site.user }
      @conversations = Conversation.where(placement_id: current_user.placements.ids)
    end
  end

  def create
    placement = Placement.find(params[:placement_id])
    if current_user.manager
      @conversation = Conversation.create!(worker_id: placement.user.id, manager_id: current_user.id, placement_id: placement.id)
    else
      @conversation = Conversation.create!(worker_id: current_user.id, manager_id: placement.project.site.user.id, placement_id: placement.id)
    end
    redirect_to user_conversation_messages_path(current_user, @conversation)
  end

  private

  def conversation_params
    params.permit(:worker_id, :manager_id)
  end
end

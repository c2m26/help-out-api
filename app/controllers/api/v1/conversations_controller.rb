class Api::V1::ConversationsController < ApplicationController

  def create
    conversation = Conversation.new(conversation_params)
    
    if conversation.save
      
      render json: {
        data: conversation,
        status: :ok
      } 
                
    else
      render json: {
        errors: conversation.errors,
        status: :unprocessably_entity
      }
    end
  end

  def getID
    conversation = Conversation.where(fulfillmentID: params[:id])
    render json: conversation[0]
  end

  def index
    conversations = Conversation.all
    render json: conversations
    
  end

  private

  def conversation_params
          params.require(:conversation).permit(:fulfillmentID)
  end

end

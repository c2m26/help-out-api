class Api::V1::MessagesController < ApplicationController
  
  def create
    message = Message.new(message_params)
    
    if message.save
      
      render json: {
        data: message,
        status: :ok
      } 
                
    else
      render json: {
        errors: message.errors,
        status: :unprocessably_entity
      }
    end
  end


  def get_Messages
    
    messages = Message.where(conversationID: params[:id])
    
    render json: {
      data: messages
    }
  end

  def index
    
    messages = Message.all
    
    render json: messages
  end

  private
    def message_params
      params.require(:message).permit(:conversationID, :senderID, :content)
    end

end

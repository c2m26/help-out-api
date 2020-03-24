require "rails_helper"
require 'faker'

RSpec.describe 'Test Message Endpoints:', :type => :request do
  
  before(:each) do
    @user = create(:user, id: "1")
    @helper = create(:user, id: "2")
    @need = create(:need, id: "1", userID: "1")
    @fulfillment = create(:fulfillment, helperID: @helper.id, needID: @need.id)
    @conversation = create(:conversation, fulfillmentID: @fulfillment.id)
    @message = create(:message, conversationID: @conversation.id, senderID: @helper.id)
    messages = create_list(:message, 4, conversationID: @conversation.id, senderID: @helper.id)
  end
  
  describe 'GET index' do
    it 'returns 200 status and all messages' do
      
      get '/api/v1/messages'
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json.length).to eq(5) 
      expect(json[Faker::Number.between(from: 0, to: 3)]).to include("conversationID" => @conversation.id)    
    end
  end

  describe 'GET specific messages' do
    it 'returns 200 status and messages belonging to a conversation' do
      
      get "/api/v1/messages/get_Messages?id=#{@conversation.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json.length).to eq(5) 
      expect(json[Faker::Number.between(from: 0, to: 3)]).to include("conversationID" => @conversation.id)
    end
  end

  describe 'Create Message' do
    it 'returns 200 status and created message' do
      headers = { }
      params = {:message => {"conversationID" => @conversation.id, "senderID"=> @helper.id, "content" => @message.content } }
      post "/api/v1/messages", :params => params , :headers => {}
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json["data"]).to include(params[:message]) 
    end
  end

end
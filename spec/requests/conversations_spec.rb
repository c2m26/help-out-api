require "rails_helper"
require 'faker'

RSpec.describe 'Test Conversation Endpoints:', :type => :request do
  
  before(:each) do
    @user = create(:user, id: "1")
    @helper = create(:user, id: "2")
    @need = create(:need, id: "1", userID: "1")
    @fulfillment = create(:fulfillment, helperID: @helper.id, needID: @need.id)
    @conversation = create(:conversation, fulfillmentID: @fulfillment.id)
    conversations = create_list(:conversation, 4, fulfillmentID: @fulfillment.id)
  end
  
  describe 'GET index' do
    it 'returns 200 status and all conversations' do
      
      get '/api/v1/conversations'
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json.length).to eq(5) 
      expect(json[Faker::Number.between(from: 0, to: 3)]).to include("fulfillmentID" => @fulfillment.id)    
    end
  end

  describe 'GET id' do
    it 'returns 200 status and conversation id for passed fulfillment id' do
      
      get "/api/v1/conversations/getID?id=#{@fulfillment.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json).to eq(@conversation.id)
    end
  end

  describe 'Create Conversation' do
    it 'returns 200 status and created conversation' do
      headers = { }
      params = {:conversation => {"fulfillmentID" => @fulfillment.id} }
      post "/api/v1/conversations", :params => params , :headers => {}
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json["data"]).to include(params[:conversation]) 
    end
  end

end
require "rails_helper"
require 'faker'

RSpec.describe 'Test Fulfillments Endpoints:', :type => :request do
  
  before(:each) do
    @user = create(:user, id: "1")
    @helper = create(:user, id: "2")
    @need = create(:need, id: "1", userID: "1")
    fulfillments = create_list(:fulfillment, 5, helperID: @helper.id, needID: @need.id)
  end
  
  describe 'GET index' do
    it 'returns 200 status and all fulfillments' do
      
      get '/api/v1/fulfillments'
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json.length).to eq(5) 
      expect(json[Faker::Number.between(from: 0, to: 4)]).to include("helperID" => @helper.id)    
    end
  end

  describe 'GET foreignKeys' do
    it 'returns 200 status message and fulfillment FKs' do
      fulfillment = create(:fulfillment, helperID: @helper.id, needID: @need.id)
      get "/api/v1/fulfillments/get_foreignKeys?id=#{fulfillment.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json).to include("helperID" => @helper.id, "needID" => @need.id)
    end
  end

  describe 'GET userFulfillments' do
    it 'returns 200 status message and user fulfillments' do
      get "/api/v1/fulfillments/get_userFulfillments?id=#{@helper.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data'].length).to eq(5)
      expect(json['data'][Faker::Number.between(from: 0, to: 4)]).to include("helperID" => @helper.id)
    end
  end

  describe 'Create Fulfillment' do
    it 'returns 200 status and created Fulfillment' do
      fulfillment = create(:fulfillment, helperID: @helper.id, needID: @need.id)
      headers = { }
      params = { "helperID" => @helper.id, "needID" => @need.id}
      post "/api/v1/fulfillments", :params => params , :headers => {}
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json["data"]).to include(params) 
    end
  end

end
require "rails_helper"
require 'faker'

RSpec.describe 'Test Needs Endpoints:', :type => :request do
  
  before(:each) do
    @user = create(:user, id: "1")
    needs = create_list(:need, 5, userID: "1")
  end
  
  describe 'GET index' do
    it 'returns 200 status message and all needs' do
      
      get '/api/v1/needs'
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json.length).to eq(5) 
      expect(json[0]).to include("userID" => 1)    
    end
  end

  describe 'GET creator_ID' do
    it 'returns 200 status message and userID' do
      need = create(:need, userID: "1")
      get "/api/v1/needs/get_creatorID?id=#{need.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json).to be(1)
    end
  end

  describe 'GET userNeeds' do
    it 'returns 200 status message and userNeeds' do
      get "/api/v1/needs/get_userNeeds?id=#{@user.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json.length).to eq(5) 
      expect(json[Faker::Number.between(from: 0, to: 4)]).to include("userID" => 1)
    end
  end

  describe 'GET openNeeds' do
    it 'returns 200 status message and openNeeds' do
      get "/api/v1/needs/get_openNeeds"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json.length).to eq(5) 
    end
  end

  describe 'GET Need' do
    it 'returns 200 status message and need matching passed id' do
      need = create(:need, userID: "1")
      get "/api/v1/needs/get_Need?id=#{need.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json).to include("id"=> need.id) 
    end
  end

  describe 'Create Need' do
    it 'returns 200 status and posted Need' do
      need = create(:need, userID: "1")
      headers = { }
      params = {:need => { "userID" => need.userID, "title" => need.title, "description" => need.description, "needType" => need.needType, "lat" => need.lat, "lng" => need.lng, "formattedAddress" => need.formattedAddress, "status" => need.status } }
      post "/api/v1/needs", :params => params , :headers => {}
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json["data"]).to include(params[:need]) 
    end
  end

  describe 'update status' do
    it 'returns 200 status and updated Need' do
      need = create(:need, id: "1", userID: "1")
      headers = { }
      # params = {:need => { "userID" => need.userID, "title" => need.title, "description" => need.description, "needType" => need.needType, "lat" => need.lat, "lng" => need.lng, "formattedAddress" => need.formattedAddress, "status" => need.status } }
      params = { "status" => "closed"}
      patch "/api/v1/needs/update_status?id=#{need.id}", :params => params , :headers => {}

      json = JSON.parse(response.body)

      expect(response.status).to eq(200)

      expect(json['status']).to eq(params["status"]) 
    end
  end

end
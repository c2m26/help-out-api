require "rails_helper"

RSpec.describe 'Test Needs Endpoints:', :type => :request do
  describe 'GET index' do
    before(:all) do
      create(:user, id: "1")
    end
    
    it 'returns 200 status message and all needs' do
      need = create_list(:need, 5, userID: "1")

      get '/api/v1/needs'
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json.length).to eq(5) 
      expect(json[0]).to include("userID" => 1)
      

    end
  end
end
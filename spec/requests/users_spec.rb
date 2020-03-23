require "rails_helper"

RSpec.describe 'Test Users Endpoints:', :type => :request do
  
  describe 'GET /api/v1/users/id' do
    
    it 'returns success status and correct user data' do
      user = create(:user)
      get "/api/v1/users/#{user.id}"  
      
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to include("firstName" => user.firstName)
    end
  end
end
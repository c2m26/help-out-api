require "rails_helper"

RSpec.describe 'Test Users Endpoints:', :type => :request do
  
  describe 'GET /api/v1/users/id' do
    
    it 'returns a status message' do
      user = create(:user)
      get "/api/v1/users/1"  
      
      expect(response).to have_http_status(:success)
    end
  end
end
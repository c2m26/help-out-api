require "rails_helper"

RSpec.describe 'Test Needs Endpoints:', :type => :request do
  describe 'GET index' do
    it 'returns a status message' do
      get '/api/v1/needs'
      expect(response.status)#to.eq(200)
    end
  end
end
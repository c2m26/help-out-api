require "rails_helper"
require 'faker'

RSpec.describe 'Test Session Endpoints:', :type => :request do
  
  before(:all) do
    @user = create(:user, email: "user@mail.com", password: "asd123")
  end
  
  describe 'Create session' do
    it 'returns 200 status, logged_in true and user' do
      headers = { }
      params = {:email => @user.email, :password => @user.password}
      post "/api/v1/sessions", :params => params , :headers => {}
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json["user"]["firstName"]).to eq(@user.firstName)     
      expect(json["user"]["email"]).to eq(@user.email)     
      expect(json["logged_in"]).to be(true)
    end
  end

  describe 'check logged_in' do
    it 'returns 200 status, session true and user' do
      # creates session
      headers = { }
      params = {"email": @user.email, "password": @user.password}
      post "/api/v1/sessions", :params => params , :headers => {}
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json["logged_in"]).to be(true)
      
      # then checks user logged in
      get "/api/v1/logged_in"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json["user"]["firstName"]).to eq(@user.firstName)     
      expect(json["user"]["email"]).to eq(@user.email)     
      expect(json["logged_in"]).to be(true)
    end
  end

  describe 'checks logout' do
    it 'deletes the user session returning logged_out true' do
      # creates session
      headers = { }
      params = {"email": @user.email, "password": @user.password}
      post "/api/v1/sessions", :params => params , :headers => {}
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json["logged_in"]).to be(true)

      # deletes the session
      delete "/api/v1/logout"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json["session"]).to eq(nil)     
      expect(json["logged_out"]).to be(true)
      expect(json["user"]).to be(nil)

    end

  end

end

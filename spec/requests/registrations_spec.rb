require "rails_helper"
require 'faker'

RSpec.describe 'Test Registration Endpoints:', :type => :request do

  before(:all) do

    @file = fixture_file_upload('files/avatar.png', 'png')
  end

  describe 'Create User / SignUp' do
    it 'returns 200 status and created User' do
      headers = { }
      params = { :firstName => "John", :lastName => "Doe", :email => "johndoe@mail.com", :password => "asd123", :password_confirmation => "asd123", :idFile => @file }
      post "/api/v1/registrations", :params => params , :headers => {}
      json = JSON.parse(response.body)


      expect(response.status).to eq(200)
      expect(json["user"]["firstName"]).to include(params[:firstName]) 
      
      user = User.find(json["user"]["id"])
      userIDdoc = user.idFile.attached?
      expect(userIDdoc).to be(true) 
    end
  end

end
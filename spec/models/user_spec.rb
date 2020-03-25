require "rails_helper"
require 'faker'

RSpec.describe User, :type => :model do
  context "creation" do
    it "successful for correct inputs" do
      user = create(:user)
      expect(user).to be_valid
    end

    it "fails with no firstName" do
      user = build(:user, firstName: nil)
      expect(user.valid?).to be (false)
      expect(user.errors[:firstName]).to include("can't be blank")
    end

    it "fails with no lasttName" do
      user = build(:user, lastName: nil)
      expect(user.valid?).to be (false)
      expect(user.errors[:lastName]).to include("can't be blank")
    end

    it "fails with no email" do
      user = build(:user, email: nil)
      expect(user.valid?).to be (false)
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "fails with invalid email" do
      user = build(:user, email: "@mail.com")
      expect(user.valid?).to be (false)
      expect(user.errors[:email]).to include("is invalid")

      user1 = build(:user, email: "user")
      expect(user1.valid?).to be (false)
      expect(user1.errors[:email]).to include("is invalid")

      user2 = build(:user, email: "user@mail")
      expect(user2.valid?).to be (false)
      expect(user2.errors[:email]).to include("is invalid")
    end
    
    it "fails with no password" do
      user = build(:user, password: nil)
      expect(user.valid?).to be (false)
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "fails with no idFile" do
      user = build(:user, idFile: nil)
      expect(user.valid?).to be (false)
      expect(user.errors[:idFile]).to include("can't be blank")
    end

    it "fails with wrong idFile format" do
      @file = Rack::Test::UploadedFile.new('spec/fixtures/files/teste.docx', 'docx')
      user = build(:user, idFile: @file )
      expect(user.valid?).to be(false)
      expect(user.errors[:idFile]).to include("has an invalid content type")
    end

    

  end
end
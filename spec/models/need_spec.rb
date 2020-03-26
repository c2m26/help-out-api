require "rails_helper"
require "faker"

RSpec.describe Need, :type => :model do
  
  # before(:all) do
  #   user = create(:user, id: 1)
  # end
  
  context "creation" do
    it "successful for correct inputs" do
      user = create(:user, id: 1)
      need = create(:need, userID: 1)
      expect(need).to be_valid
    end

    it "fails with no title" do
      need = build(:need, title: nil)
      expect(need.valid?).to be (false)
      expect(need.errors[:title]).to include("can't be blank")
    end

    it "fails with no description" do
      need = build(:need, description: nil)
      expect(need.valid?).to be (false)
      expect(need.errors[:description]).to include("can't be blank")
    end

    it "fails with no needType" do
      need = build(:need, needType: nil)
      expect(need.valid?).to be (false)
      expect(need.errors[:needType]).to include("can't be blank")
    end

    it "fails with no lat" do
      need = build(:need, lat: nil)
      expect(need.valid?).to be (false)
      expect(need.errors[:lat]).to include("can't be blank")
    end
    
    it "fails with no lng" do
      need = build(:need, lng: nil)
      expect(need.valid?).to be (false)
      expect(need.errors[:lng]).to include("can't be blank")
    end

    it "fails with no formattedAddress" do
      need = build(:need, formattedAddress: nil)
      expect(need.valid?).to be (false)
      expect(need.errors[:formattedAddress]).to include("can't be blank")
    end

    it "fails with no status" do
      need = build(:need, status: nil)
      expect(need.valid?).to be (false)
      expect(need.errors[:status]).to include("can't be blank")
    end

    it "fails with title longer than 60 char" do
      need = build(:need, title: Faker::Lorem.characters(number: 61))
      expect(need.valid?).to be (false)
      expect(need.errors[:title]).to include("is too long (maximum is 60 characters)")
    end

    it "fails with description longer than 300 char" do
      need = build(:need, description: Faker::Lorem.characters(number: 301))
      expect(need.valid?).to be (false)
      expect(need.errors[:description]).to include("is too long (maximum is 300 characters)")
    end

  end
end
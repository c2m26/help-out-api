class Need < ApplicationRecord
  
  validates :userID, :title, :description, :needType, :lat, :lng, :formattedAddress, :status, presence: true
  validates_length_of :title, maximum: 60
  validates_length_of :description, maximum: 300
    
end

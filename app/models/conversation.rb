class Conversation < ApplicationRecord
  belongs_to :fulfillment, foreign_key: 'fulfillmentID'
  has_many :messages
end

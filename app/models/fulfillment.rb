class Fulfillment < ApplicationRecord
  belongs_to :user, foreign_key: 'helperID'
  belongs_to :need, foreign_key: 'needID'
  has_one :conversation
end

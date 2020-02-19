class Message < ApplicationRecord
  belongs_to :conversation, foreign_key: 'conversationID'
end

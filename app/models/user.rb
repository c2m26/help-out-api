class User < ApplicationRecord
    has_secure_password
    has_one_attached :idFile

    has_many :needs
    has_many :helpers
    has_many :fulfillments, through: :helpers 

    validates :firstName,:lastName,:password, presence: true
    validates :email, presence: true, uniqueness: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
    
    # validates :idFile, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg', 'pdf'] }
    
    validates :idFile, attached: true, content_type: [:png, :jpg, :jpeg, :pdf]
    
end

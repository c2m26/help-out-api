class User < ApplicationRecord
    has_secure_password
    has_one_attached :idFile
    # validates_attachment :idFile, presence: true

    validates :firstName,:lastName,:password, presence: true
    validates :email, presence: true, uniqueness: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
    
end

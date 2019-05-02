class TempUser < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :mail_address, presence: true
    validates :mail_address, format: { with: VALID_EMAIL_REGEX }
end

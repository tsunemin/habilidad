class Client < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { maximum: 25 }
end

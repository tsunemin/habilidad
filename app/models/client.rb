class Client < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :commercial_distribution, length: { maximum: 100 }
end

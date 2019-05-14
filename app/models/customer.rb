class Customer < ApplicationRecord
  validates :name, :phone, :address, :city, :state, :postal_code, :registered_at, presence: true

  has_many :rentals
end

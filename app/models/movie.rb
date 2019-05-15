class Movie < ApplicationRecord
  has_many :rentals

  validates :title, :overview, :release_date, :inventory, presence: true

  def available_inventory
    num_unavailable = 0

    self.rentals.each do |rental|
      if rental.status == "unavailable"
        num_unavailable += 1
      end
    end
    return self.inventory - num_unavailable
  end
end

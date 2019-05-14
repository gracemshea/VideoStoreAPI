class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :customer

  private

  def rental_params
    params.permit(:customer_id, :movie_id)
  end
end

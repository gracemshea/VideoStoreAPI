class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :customer

  def movie_avail?(movie_id)
    movie = Movie.find_by(id: movie_id)

    if movie.nil?
      return false
    elsif movie.inventory > 0
      return true
    else
      return false
    end
  end
end

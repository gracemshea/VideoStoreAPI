require "test_helper"

describe Movie do
  let(:movie) { movies(:wild) }

  describe "validations" do
    it "requires a title" do
      movie.title = nil

      valid_movie = movie.valid?

      expect(movie.valid?).must_equal false
      expect(movie.errors.messages).must_include :title
      expect(movie.errors.messages[:title]).must_equal ["can't be blank"]
    end

    it "requires an overview" do
      movie.overview = nil

      valid_movie = movie.valid?

      expect(movie.valid?).must_equal false
      expect(movie.errors.messages).must_include :overview
      expect(movie.errors.messages[:overview]).must_equal ["can't be blank"]
    end

    it "requires a release date" do
      movie.release_date = nil

      valid_movie = movie.valid?

      expect(movie.valid?).must_equal false
      expect(movie.errors.messages).must_include :release_date
      expect(movie.errors.messages[:release_date]).must_equal ["can't be blank"]
    end

    it "requires inventory" do
      movie.inventory = nil

      valid_movie = movie.valid?

      expect(movie.valid?).must_equal false
      expect(movie.errors.messages).must_include :inventory
      expect(movie.errors.messages[:inventory]).must_equal ["can't be blank"]
    end
  end

  describe "relationship" do
    it "can have many rentals" do
      movie.must_respond_to :rentals
      movie.rentals.each do |item|
        item.must_be_kind_of Rental
      end
    end
  end
end

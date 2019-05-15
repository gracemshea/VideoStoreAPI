require "test_helper"

describe Rental do
  let(:rental) { rentals(:one) }

  describe "validations" do
    it "must be valid" do
      value(rental).must_be :valid?
    end

    it "has required fields" do
      fields = [:movie_id, :customer_id, :check_out, :check_in, :status]

      fields.each do |field|
        expect(rental).must_respond_to field
      end
    end

    it "must have a check_out date" do
      rental.check_out = nil
      valid = rental.save

      expect(valid).must_equal false
      expect(rental.errors.messages).must_include :check_out
    end

    it "must have a check_in date" do
      rental.check_in = nil
      valid = rental.save

      expect(valid).must_equal false
      expect(rental.errors.messages).must_include :check_in
    end

    it "must have a status" do
      rental.status = nil
      valid = rental.save

      expect(valid).must_equal false
      expect(rental.errors.messages).must_include :status
    end
  end

  describe "relations" do
    it "must have a Customer" do
      rental_one = rentals(:one)
      rental_one.must_respond_to :customer
      rental_one.customer.must_be_kind_of Customer
      rental_one.customer.name.must_equal "Stugene"
      rental_one.customer.must_equal customers(:one)
    end

    it "rejects a rental without an customer" do
      @rental.customer_id = nil
      @rental.save
      result = @rental.valid?

      expect(result).must_equal false
      expect(@rental.errors.messages).must_include :customer_id
    end

    it "must have a movie" do
      rental_one = rentals(:one)
      rental_one.must_respond_to :movie
      rental_one.movie.must_be_kind_of Movie
      rental_one.movie.title.must_equal "Wild Hearts Can't Be Broken"
      rental_one.movie.must_equal movies(:one)
    end

    it "rejects a rental without an movie" do
      @rental.movie_id = nil
      @rental.save
      result = @rental.valid?

      expect(result).must_equal false
      expect(@rental.errors.messages).must_include :movie_id
    end
  end
  describe "custom method " do
    it "checks if no movie is available when all are checked out" do
      #TO DO: HOW TO SET UP A CHECKED OUT MOVIE
    end

    it "checks that movie is available when there are more in inventory than are checked out" do
    end

    it "checks that movie is not available when there are none in inventory" do
    end
  end
end

describe "availability" do
  let(:rental_two) {
    Rental.new(
      movie_id: movies(:other_test).id,
      customer_id: customers(:shelley).id,
      checkout: DateTime.now,
      due: DateTime.now + 7.days,
    )
  }
  it "won't be valid if movie is unavailable" do
    rental_two.movie.inventory = 0
    value(rental_two).wont_be :valid?
  end
end

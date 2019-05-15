require "test_helper"

describe Rental do
  let(:rental) { Rental.new }

  it "must be valid" do
    value(rental).must_be :valid?
  end

  describe "relations" do
    it "must have a Customer" do
      rental_one = rentals(:one)
      rental_one.must_respond_to :customer
      rental_one.customer.must_be_kind_of Customer
      rental_one.customer.name.must_equal "Stugene"
      rental_one.customer.must_equal customers(:one)
    end

    it "must have a Movie" do
      rental_one = rentals(:one)
      rental_one.must_respond_to :movie
      rental_one.movie.must_be_kind_of Movie
      rental_one.movie.title.must_equal "Wild Hearts Can't Be Broken"
      rental_one.movie.must_equal movies(:one)
    end
  end
end

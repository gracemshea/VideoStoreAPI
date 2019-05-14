require "test_helper"

describe Customer do
  # let(:customer) { Customer.new }

  describe "validations" do
    let(:customer) { customers(:one) }

    it "must be valid" do
      value(customer).must_be :valid?
    end

    it "must have a name" do
      customer.name = nil
      customer.valid?.must_equal false
    end

    it "must have a address" do
      customer.phone = nil
      customer.valid?.must_equal false
    end

    it "must have a city" do
      customer.phone = nil
      customer.valid?.must_equal false
    end

    it "must have a state" do
      customer.phone = nil
      customer.valid?.must_equal false
    end

    it "must have a postal_code" do
      customer.phone = nil
      customer.valid?.must_equal false
    end

    it "must have a phone" do
      customer.phone = nil
      customer.valid?.must_equal false
    end

    it "must have a registered date" do
      customer.registered_at = nil
      customer.valid?.must_equal false
    end
  end
end

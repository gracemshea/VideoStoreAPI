class CustomersController < ApplicationController
  def index
    customers = Customer.all

    render json: customers.as_json(only: [:name, :phone, :address, :city, :state, :postal_code, :registered_at]),
           status: :ok
  end
end

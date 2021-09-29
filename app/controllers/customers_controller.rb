class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    binding.pry
    @customer = Customer.new(customer_params)
    binding.pry
    if @customer.save
      redirect_to root_path
    else
      render new_customer_path
    end
  end
end

private

def customer_params
  params.require(:customer).permit(:first_name, :last_name, :first_name_kana,
                                   :last_name_kana, :address, :phone_number, :birth_date, :job)
end

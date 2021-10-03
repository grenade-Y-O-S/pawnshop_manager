class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to new_pawn_path(@customer.id)
    else
      render new_customer_path
    end
  end

  def input
  end

  def search
    @column = params[:column]
    word = params[:word]
    @customer = Customer.where("#{column} LIKE?","#{word}%")
    redirect_to search_customers_path
  end

private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana,
                                     :last_name_kana, :address, :phone_number, :birth_date, :job)
  end
end

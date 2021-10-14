class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      if params[:format] == "pawn"
        redirect_to new_pawn_path(@customer.id)
      elsif params[:format] == "purchase"
        redirect_to new_purchase_path(@customer.id)
      end
    else
      render new_customer_path
    end
  end

  def input
  end

  def search
    @column = params[:column]
    word = params[:word]
    @customer = Customer.search(@column, word)
  end

private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                     :address, :phone_number, :birth_date, :job)
  end
end

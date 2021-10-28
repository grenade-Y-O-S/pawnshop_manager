class CustomersController < ApplicationController
  before_action :set_customer_id, only: [:edit, :update]
  before_action :set_customer, only: [:show, :edit_result]

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

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to edit_result_customers_path(@customer.id)
    else
      render action: :edit
    end
  end

  def search
    @column = params[:column]
    word = params[:word]
    @customer = SearchCustomersService.search_customer_data(@column, word)
  end

  def edit_result
  end

private
  def set_customer
    @customer = Customer.find(params[:format])
  end

  def set_customer_id
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                     :address, :phone_number, :birth_date, :job)
  end
end

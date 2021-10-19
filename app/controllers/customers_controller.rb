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
    if word == ''
      @customer = nil
    elsif @column == "id"
      if Pawn.exists?(word)
        @pawn = Pawn.find(word)
        @customer = Customer.find(@pawn.customer_id)
      else
        @customer = nil
      end
    else
      if Customer.search(@column, word).exists?
        @customer = Customer.search(@column, word)
      else
        @customer = nil
      end
    end
  end

private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                     :address, :phone_number, :birth_date, :job)
  end
end

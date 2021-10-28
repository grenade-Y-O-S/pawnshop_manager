class PurchasesController < ApplicationController
  before_action :set_customer, except: [:index, :result]
  before_action :set_purchase, only: [:create]
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @purchase = Purchase.new
  end

  def create
    if @purchase.save
      redirect_to result_purchases_path(@purchase.id)
    else
      render new_pawn_path
    end
  end

  def result
    @purchase = Purchase.find(params[:format])
    @customer = Customer.find(@purchase.customer_id)
  end

  def edit

  end

  def update

  end

  private
  def set_customer
    @customer = Customer.find(params[:format])
  end

  def set_purchase
    @purchase = Purchase.new(purchase_params)
  end

  def move_to_index
    redirect_to root_path if params[:format] == nil
  end

  def purchase_params
    params.require(:purchase).permit(:buy_item_name, :buy_item_price, :buy_item_detail, :buy_item_remarks)
                             .merge(customer_id: params[:format])
  end

end

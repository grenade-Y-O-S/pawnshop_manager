class PurchasesController < ApplicationController
  before_action :move_to_index, except: [:index, :edit, :update]
  before_action :move_to_index_id, only: [:edit, :update]
  before_action :set_purchase_id, only: [:edit, :update]
  before_action :set_customer, except: [:index, :result, :edit, :update]

  def index
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to result_purchases_path(@purchase.id, process: "create")
    else
      render new_pawn_path
    end
  end

  def result
    @purchase = Purchase.find(params[:format])
    @customer = Customer.find(@purchase.customer_id)
  end

  def edit
    @customer = Customer.find(@purchase.customer_id)
  end

  def update
    if @purchase.update(purchase_edit_params)
      redirect_to result_purchases_path(@purchase.id, process: "update")
    else
      render action: :edit
    end
  end

  private
  def set_customer
    @customer = Customer.find(params[:format])
  end

  def set_purchase_id
    @purchase = Purchase.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if params[:format] == nil
  end

  def move_to_index_id
    redirect_to root_path if params[:id] == nil
  end

  def purchase_params
    params.require(:purchase).permit(:buy_item_name, :buy_item_price, :buy_item_detail, :buy_item_remarks)
                             .merge(customer_id: params[:format])
  end

  def purchase_edit_params
    params.require(:purchase).permit(:buy_item_name, :buy_item_price, :buy_item_detail, :buy_item_remarks)
  end

end

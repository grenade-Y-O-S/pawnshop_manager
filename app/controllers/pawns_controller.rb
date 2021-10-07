class PawnsController < ApplicationController
  before_action :set_customer, only: [:new, :create]
  before_action :move_to_index, only: [:new, :create]

  def index
  end

  def new
    redirect_to root_path if params[:format] == nil
    @pawn = Pawn.new
  end

  def create
    @pawn = Pawn.new(pawn_params)
    if @pawn.save
      redirect_to root_path
    else
      render new_pawn_path
    end
  end

private
  def set_customer
    @customer = Customer.find(params[:format])
  end

  def move_to_index
    redirect_to root_path if params[:format] == nil
  end

  def pawn_params
    params.require(:pawn).permit(:item_name, :item_price, :item_detail, :item_remarks, :item_status)
                         .merge(customer_id: params[:format])
  end
end

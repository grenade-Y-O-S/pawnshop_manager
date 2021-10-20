class PawnsController < ApplicationController
  before_action :set_customer, except: [:index, :result]
  before_action :set_pawn, only: [:create]
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @pawn = Pawn.new
  end

  def create
    if @pawn.save
      redirect_to result_pawns_path(@pawn.id)
    else
      render new_pawn_path
    end
  end

  def result
    @pawn = Pawn.find(params[:format])
    @customer = Customer.find(@pawn.customer_id)
  end

private
  def set_customer
    @customer = Customer.find(params[:format])
  end

  def set_pawn
    @pawn = Pawn.new(pawn_params)
  end

  def move_to_index
    redirect_to root_path if params[:format] == nil
  end

  def pawn_params
    params.require(:pawn).permit(:item_name, :item_price, :item_detail, :item_remarks, :item_status)
                         .merge(customer_id: params[:format])
  end
end

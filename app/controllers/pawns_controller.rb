class PawnsController < ApplicationController
  def index
  end

  def new
#    redirect_to root_path if @customer == nil
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

  def pawn_params
    params.require(:pawn).permit(:item_name, :item_price, :item_detail,:item_remarks, :item_status)
                         .merge(customer_id: @customer.id)
  end
end

class PawnsController < ApplicationController
  before_action :set_customer, only: [:new, :create]
  before_action :set_pawn, only: [:create, :update]
  before_action :set_pawn_format, only: [:result, :return_edit]
  before_action :move_to_index, except: [:index, :return_input, :return_search]

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

  def update
    if @pawn.update(pawn_params)
      redirect_to result_pawns_path(@pawn.id)
    else
      render return_edit_pawn_path
    end
  end

  def result
    @customer = Customer.find(@pawn.customer_id)
  end

  def return_input
  end

  def return_search
    @column = params[:column]
    word = params[:word]
    @pawns = SearchPawnsService.search_pawn_total_data(@column, word)
  end

  def return_edit

  end

private
  def set_customer
    @customer = Customer.find(params[:format])
  end

  def set_pawn
    @pawn = Pawn.new(pawn_params)
  end

  def set_pawn_format
    @pawn = Pawn.find(params[:format])
  end

  def move_to_index
    redirect_to root_path if params[:format] == nil
  end

  def pawn_params
    params.require(:pawn).permit(:item_name, :item_price, :item_detail, :item_remarks, :item_status)
                         .merge(customer_id: params[:format])
  end
end

class PawnsController < ApplicationController
  before_action :set_customer, only: [:new, :create]
  before_action :set_pawn_format, only: [:result, :status_edit, :status_result]
  before_action :move_to_index, except: [:index, :status_input, :status_search, :update]
  before_action :set_customer_pid, only: [:result, :status_edit, :status_result]

  def index
  end

  def new
    @pawn = Pawn.new
  end

  def create
    @pawn = Pawn.new(pawn_params)
    if @pawn.save
      redirect_to result_pawns_path(@pawn.id)
    else
      render new_pawn_path
    end
  end

  def update
    redirect_to root_path if params[:id] == nil
    pawn = Pawn.find(params[:id])
    pawn.update(pawn_status_params)
    redirect_to status_result_pawns_path(pawn.id)
  end

  def result

  end

  def status_input
  end

  def status_search
    @column = params[:column]
    word = params[:word]
    @pawns = SearchPawnsService.search_pawn_total_data(@column, word, 0)
  end

  def status_edit

  end

  def status_result

  end

private
  def set_customer
    @customer = Customer.find(params[:format])
  end

  def set_pawn_format
    @pawn = Pawn.find(params[:format])
  end

  def set_customer_pid
    @customer = Customer.find(@pawn.customer_id)
  end

  def move_to_index
    redirect_to root_path if params[:format] == nil
  end

  def pawn_params
    params.require(:pawn).permit(:item_name, :item_price, :item_detail, :item_remarks, :item_status)
                         .merge(customer_id: params[:format])
  end

  def pawn_status_params
    params.require(:pawn).permit(:item_status)
  end
end

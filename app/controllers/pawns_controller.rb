class PawnsController < ApplicationController
  before_action :move_to_index, except: [:index, :status_input, :status_search, :edit, :update]
  before_action :move_to_index_id, only: [:edit, :update]
  before_action :set_pawn_format, only: [:result, :status_edit, :status_result, :edit_result]
  before_action :set_pawn_id, only: [:edit, :update]
  before_action :set_customer, only: [:new, :create]
  before_action :set_customer_pid, only: [:result, :status_edit, :status_result, :edit, :edit_result, :update]

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

  def edit
  end

  def update
    if params[:process] == "edit"
      if @pawn.update(pawn_edit_params)
        redirect_to edit_result_pawns_path(@pawn.id)
      else
        render action: :edit
      end
    else
      if @pawn.update(pawn_status_params)
        if params[:process] == "return"
          redirect_to status_result_pawns_path(@pawn.id, process: "return")
        elsif params[:process] == "forfeit"
          redirect_to status_result_pawns_path(@pawn.id, process: "forfeit")
        end
      else
        render status_edit_pawns_path
      end
    end
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

  def edit_result

  end

private
  def set_pawn_format
    @pawn = Pawn.find(params[:format])
  end

  def set_pawn_id
    @pawn = Pawn.find(params[:id])
  end

  def set_customer
    @customer = Customer.find(params[:format])
  end

  def set_customer_pid
    @customer = Customer.find(@pawn.customer_id)
  end

  def move_to_index
    redirect_to root_path if params[:format] == nil
  end

  def move_to_index_id
    redirect_to root_path if params[:id] == nil
  end

  def pawn_params
    params.require(:pawn).permit(:item_name, :item_price, :item_detail, :item_remarks, :item_status)
                         .merge(customer_id: params[:format])
  end

  def pawn_status_params
    params.require(:pawn).permit(:item_status)
  end

  def pawn_edit_params
    params.require(:pawn).permit(:item_name, :item_price, :item_detail, :item_remarks, :item_status)
  end

end

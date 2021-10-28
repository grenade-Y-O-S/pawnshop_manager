class InterestsController < ApplicationController
  before_action :move_to_index, except: [:index, :search, :edit, :update]
  before_action :move_to_index_id, only: [:edit, :update]
  before_action :set_interest, only: [:edit, :update]
  before_action :set_pawn, only: [:new, :create]
  def index
  end

  def new
    @interest = Interest.new
    total_interest = Interest.total_interest(@pawn[:id])
  end

  def create
    @interest = Interest.new(interest_params)
    if @interest.save
      redirect_to result_interests_path(@pawn.id, process: "create")
    else
      render new_interest_path
    end
  end

  def result
    @interest = Interest.find(params[:format])
    @pawn = Pawn.find(@interest.pawn_id)
    @customer = Customer.find(@pawn.customer_id)
  end

  def search
    @column = params[:column]
    word = params[:word]
    @pawns = SearchPawnsService.search_pawn_total_data(@column, word, 0)
  end

  def edit
    @pawn = Pawn.find(@interest.pawn_id)
  end

  def update
    @pawn = Pawn.find(@interest.pawn_id)
    if @interest.update(interest_edit_params)
      redirect_to result_interests_path(@pawn.id, process: "update")
    else
      render action: :edit
    end
  end


  private
  def move_to_index
    redirect_to root_path if params[:format] == nil
  end

  def move_to_index_id
    redirect_to root_path if params[:id] == nil
  end
  
  def set_interest
    @interest = Interest.find(params[:id])
  end

  def set_pawn
    @pawn = Pawn.find(params[:format])
  end

  def set_pawn_iid
    @pawn = Pawn.find(@interest.pawn_id)
  end

  def interest_params
    params.require(:interest).permit(:interests_number).merge(pawn_id: params[:format])
  end

  def interest_edit_params
    params.require(:interest).permit(:interests_number)
  end
end


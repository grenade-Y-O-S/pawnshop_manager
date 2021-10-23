class InterestsController < ApplicationController
  before_action :set_pawn, only: [:new, :create]
  before_action :move_to_index, except: [:index, :search]

  def index
  end

  def new
    @interest = Interest.new
    total_interest = Interest.total_interest(@pawn[:id])
  end

  def create
    @interest = Interest.new(interest_params)
    if @interest.save
      redirect_to result_interests_path(@pawn.id)
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


  private
  def set_pawn
    @pawn = Pawn.find(params[:format])
  end

  def move_to_index
    redirect_to root_path if params[:format] == nil
  end

  def interest_params
    params.require(:interest).permit(:interests_number).merge(pawn_id: params[:format])
  end

  def move_to_index
    redirect_to root_path if params[:format] == nil
  end
end


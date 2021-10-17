class InterestsController < ApplicationController
  before_action :set_pawn, only: [:new, :create]
  def index
  end

  def search
    word = params[:word]
    @pawn = Interest.search_pawn_data(word)
  end

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(interest_params)
    binding.pry
    if @interest.save
      redirect_to root_path
    else
      render new_interest_path(@pawn.id)
    end
  end

  def result
    @interest = Interest.find(params[:format])
    @pawn = Pawn.find(@interest.pawn_id)
    @customer = Customer.find(@pawn.customer_id)
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
end

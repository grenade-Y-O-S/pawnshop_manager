class InterestsController < ApplicationController
  before_action :set_pawn, only: [:new, :create]
  def index
  end

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(interest_params)
    if @interest.save
      redirect_to result_interests_path(@pawn.id)
    else
      render new_interest_path(@pawn.id)
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
    if word == nil
      @pawns = nil
    elsif @column == "id"
      if Pawn.exists?(word)
        @pawn = Pawn.find(word)
        @customer = Customer.find(@pawn.customer_id)
        @pawns << get_pawns_data(@customer, @pawn)
      else
        @pawns = nil
      end
    else
      if Customer.search(@column, word).exists?
        pawns_data = search_by_name(@column, word)
      else
        @pawns = nil
      end
    end
  end

  def pawn_timelimit(pawn_id)
    pawn_date = Pawn.find(pawn_id).created_at.to_date
    total = total_interest(pawn_id)
    timelimit = ((pawn_date >> (total + 3)) - 1).strftime("%Y年%m月%d日")
    return timelimit
  end

  def search_by_name(column, word)
    @customers = Customer.search(column, word)
    @pawns = []
    @customers.each do |customer|
      pawns_data = Pawn.where(customer_id: customer[:id])
      pawns_data.each do |pawn|
        @pawns << get_pawns_data(customer, pawn)
      end
    end
    return @pawns
  end

  def get_pawns_data(customer, pawn)
    name = "#{customer[:last_name]} #{customer[:first_name]}"
    price = pawn[:item_price]
    total = total_interest(pawn[:id])
    limit_date = pawn_timelimit(pawn[:id])
    @pawn = {name: name, price: price, interest: interest_calculator(price), total_interest: total, date: pawn[:created_at].to_date, limit_date: limit_date}
    return @pawn
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

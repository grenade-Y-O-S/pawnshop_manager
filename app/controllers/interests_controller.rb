class InterestsController < ApplicationController
  before_action :set_pawn, only: [:new, :create]
  def index
  end

  def new
    @interest = Interest.new
    @pawn = Pawn.find(params[:format])
    total_interest = Interest.total_interest(@pawn[:id])
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
    @pawns = search_pawn_total_data(@column, word)
  end

  def search_pawn_total_data(column, word)
    @pawns = []
    if word == ''
      return nil
    elsif @column == "id"
      if Pawn.exists?(word)
        @pawn = Pawn.find(word)
        @customer = Customer.find(@pawn.customer_id)
        @pawns << get_pawns_data(@customer, @pawn)
        return @pawns
      else
        return  nil
      end
    else
      if Customer.search(@column, word).exists?
        @customers = Customer.search(column, word)
        @customers.each do |customer|
          pawns_data = Pawn.where(customer_id: customer[:id]).order("created_at DESC")
          pawns_data.each do |pawn|
            @pawns << get_pawns_data(customer, pawn)
          end
        end
        return @pawns
      else
        return  nil
      end
    end
  end

  def get_pawns_data(customer, pawn)
    name = "#{customer[:last_name]} #{customer[:first_name]}"
    @pawn = {id: pawn[:id], name: name, item_name: pawn[:item_name], price: pawn[:item_price], remarks: pawn[:remarks], total_interest: Interest.total_interest(pawn[:id]), date: pawn[:created_at].to_date.strftime("%Y年%m月%d日"), id: pawn[:id]}
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

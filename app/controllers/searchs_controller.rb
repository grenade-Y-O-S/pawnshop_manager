class SearchsController < ApplicationController
  def index
  end

  def input_customer

  end

  def result_customer 
    @column = params[:column]
    word = params[:word]
    @customer = SearchCustomersService.search_customer_data(@column, word)
  end

  def input_pawn

  end

  def result_pawn
    @column = params[:column]
    word = params[:word]
    @pawns = SearchPawnsService.search_pawn_total_data(@column, word, "free")
  end
end

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
end

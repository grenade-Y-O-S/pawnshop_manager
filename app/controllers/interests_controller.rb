class InterestsController < ApplicationController
  def index
  end

  def search
    word = params[:word]
    @pawn = Interest.search_pawn_data(word)
  end
end

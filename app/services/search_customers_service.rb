class SearchCustomersService
  def self.search_customer_data(column, word)
    if word == ''
      return nil
    elsif @column == "id"
      if Pawn.exists?(word)
        @pawn = Pawn.find(word)
        return Customer.find(@pawn.customer_id)
      else
        return nil
      end
    else
      if Customer.search(column, word).exists?
        return Customer.search(column, word)
      else
        return nil
      end
    end
  end
end
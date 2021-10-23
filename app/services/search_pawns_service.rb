class SearchPawnsService
  def self.search_pawn_total_data(column, word, status)
    @pawns = []
    if word == ''
      return nil
    elsif column == "id"
      if status == "free"
        if Pawn.exists?(word)
          @pawn = Pawn.find(word)
        else
          return  nil
        end
      elsif Pawn.check_pawn_status(column, word, status)
          @pawn = Pawn.search_pawn_status(column, word, status)
      else
        return  nil
      end
      @customer = Customer.find(@pawn.customer_id)
      @pawns << get_pawns_data(@customer, @pawn)
      return @pawns
    else
      if Customer.search(column, word).exists?
        @customers = Customer.search(column, word)
        counter = 0
        @customers.each do |customer|
          if Pawn.check_pawn_status("customer_id", customer[:id], status)
            pawns_data = Pawn.where_pawn_status("customer_id", customer[:id], status).order("created_at DESC")
            pawns_data.each do |pawn|
              @pawns << get_pawns_data(customer, pawn)
              counter += 1
            end
          end
        end
        if counter == 0
          return nil
        else
          return @pawns
        end
      else
        return  nil
      end
    end
  end

  def self.get_pawns_data(customer, pawn)
    name = "#{customer[:last_name]} #{customer[:first_name]}"
    @pawn = {id: pawn[:id], name: name, item_name: pawn[:item_name], price: pawn[:item_price], remarks: pawn[:remarks], total_interest: Interest.total_interest(pawn[:id]), date: pawn[:created_at].to_date.strftime("%Y年%m月%d日"), id: pawn[:id]}
    return @pawn
  end


end
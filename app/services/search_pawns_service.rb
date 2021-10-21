class SearchPawnsService
  def self.search_pawn_total_data(column, word)
    @pawns = []
    if word == ''
      return nil
    elsif column == "id"
      if Pawn.exists?(word)
        @pawn = Pawn.find(word)
        @customer = Customer.find(@pawn.customer_id)
        @pawns << get_pawns_data(@customer, @pawn)
        return @pawns
      else
        return  nil
      end
    else
      if Customer.search(column, word).exists?
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

  def self.get_pawns_data(customer, pawn)
    name = "#{customer[:last_name]} #{customer[:first_name]}"
    @pawn = {id: pawn[:id], name: name, item_name: pawn[:item_name], price: pawn[:item_price], remarks: pawn[:remarks], total_interest: Interest.total_interest(pawn[:id]), date: pawn[:created_at].to_date.strftime("%Y年%m月%d日"), id: pawn[:id]}
    return @pawn
  end
end
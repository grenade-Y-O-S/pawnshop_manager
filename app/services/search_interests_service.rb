class SearchInterestsService
  def self.search_interest_total_data(column, word)
    interests = []
    if word == ''
      return nil
    elsif column == "id"
      if Interest.exists?(word)
        @interest = Interest.find(word)
      else
        return  nil
      end
      @pawn = Pawn.find(@interest.pawn_id)
      @customer = Customer.find(@pawn.customer_id)
      interests << get_interests_data(@customer, @pawn, @interest)
      return interests
    elsif column == "pawn_id"
      if Pawn.exists?(word)
        @pawn = Pawn.find(word)
      else
        return  nil
      end
      @interest = Interest.find_by(column, word)
      @customer = Customer.find(@pawn.customer_id)
      interests << get_interests_data(@customer, @pawn, @interest)
      return interests
    else
      if Customer.search(column, word).exists?
        @customers = Customer.search(column, word)
        counter = 0
        @customers.each do |customer|
          pawns_data = Pawn.search("customer_id", customer[:id])
          pawns_data.each do |pawn|
            interests_data = Interest.search("pawn_id", pawn[:id])
            interests_data.each do |interest|
              interests << get_interests_data(customer, pawn, interest)
              counter += 1
            end
          end
        end
        if counter == 0
          return nil
        else
          return interests
        end
      else
        return  nil
      end
    end
  end

  def self.get_interests_data(customer, pawn, interest)
    name = "#{customer[:last_name]} #{customer[:first_name]}"
    data = {name: name, item_name: pawn[:item_name], price: pawn[:item_price], number: interest[:interests_number], date: interest[:created_at].to_date.strftime("%Y年%m月%d日"), id: interest[:id]}
    return data
  end
end
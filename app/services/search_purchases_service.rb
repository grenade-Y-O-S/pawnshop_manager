class SearchPurchasesService
  def self.search_purchase_total_data(column, word)
    purchases = []
    if word == ''
      return nil
    elsif column == "id"
      if Purchase.exists?(word)
        @purchase = Purchase.find(word)
      else
        return  nil
      end
      @customer = Customer.find(@purchase.customer_id)
      purchases << get_purchases_data(@customer, @purchase)
      return purchases
    else
      if Customer.search(column, word).exists?
        @customers = Customer.search(column, word)
        counter = 0
        @customers.each do |customer|
          purchases_data = Purchase.where("customer_id", customer[:id]).order("created_at DESC")
          purchases_data.each do |purchase|
            purchases << get_purchases_data(customer, purchase)
            counter += 1
          end
        end
        if counter == 0
          return nil
        else
          return purchases
        end
      else
        return  nil
      end
    end
  end

  def self.get_purchases_data(customer, purchase)
    name = "#{customer[:last_name]} #{customer[:first_name]}"
    purchase = {name: name, item_name: purchase[:buy_item_name], price: purchase[:buy_item_price], detail: purchase[:buy_item_detail], date: purchase[:created_at].to_date.strftime("%Y年%m月%d日"), id: purchase[:id]}
    return purchase
  end

end
module PawnsHelper
  def interest_calculator(price)
    if price < 30000
      interest = price / 100 * 8
    elsif price > 100000
      interest = price / 100 * 5
    else
      interest = (price - 30000) / 100 * 5 + 2400
    end
    return interest
  end
end

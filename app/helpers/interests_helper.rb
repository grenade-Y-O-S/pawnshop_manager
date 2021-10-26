module InterestsHelper
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

  def pawn_timelimit(pawn_id)
    pawn_date = Pawn.find(pawn_id).created_at.to_date
    total = Interest.total_interest(pawn_id)
    timelimit = ((pawn_date >> (total + 3)) - 1).strftime("%Y年%m月%d日")
    return timelimit
  end

  def interests_counter(pawn_id)
    pawn = Pawn.find(pawn_id)
    pawn_date = pawn[:created_at].to_date
    interests_number = Interest.total_interest(pawn_id)
    interest_price = interest_calculator(pawn[:item_price])
    months = 1
    today = Date.current
    while ((pawn_date >> months) < today) do
      months += 1
    end
    return months
  end

  def pay_number(pawn_id)
    months = interests_counter(pawn_id)
    interests_number = Interest.total_interest(pawn_id)
    pay_number = months - interests_number
    if pay_number < 0
      pay_number = 0
    end
    return pay_number
  end
end
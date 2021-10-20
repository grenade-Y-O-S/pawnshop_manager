module InterestsHelper
  def interest_calculator(price)
    if price < 30000
      interest = price / 100 * 8
    elsif price > 100000
      interest = price / 100 * 5
    else
      interest = (price - 30000) / 100 * 5 + 2400
    end
    return interest.to_s(:delimited)
  end

  def pawn_timelimit(pawn_id)
    pawn_date = Pawn.find(pawn_id).created_at.to_date
    total = Interest.total_interest(pawn_id)
    timelimit = ((pawn_date >> (total + 3)) - 1).strftime("%Y年%m月%d日")
    return timelimit
  end
end

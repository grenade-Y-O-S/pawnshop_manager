require "date"

module InterestsHelper
  def total_interest(id)
    if Interest.exists?(id: id)
      interests = Interest.where(pawn_id: id)
      total = 0
      interests.each do |data|
        total += data[:interests_number]
      end
      return total
    else
      return 0
    end
  end

  def pawn_timelimit(pawn_id)
    pawn_date = Pawn.find(pawn_id).created_at.to_date
    total = total_interest(pawn_id)
    timelimit = ((pawn_date >> (total + 3)) - 1).strftime("%Y年%m月%d日")
    return timelimit
  end
end

module InterestsHelper
  def total_interest(id)
    interests = Interest.where(pawn_id: id)
    total = 0
    interests.each do |data|
      total += data[:interests_number]
    end
    return total
  end
end

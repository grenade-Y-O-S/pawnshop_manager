class Interest < ApplicationRecord
  belongs_to :pawn

  with_options presence: true do
    validates :interests_number, numericality: { other_than: 0 }, format: { with: /\A^[0-9]+\z/ }
  end

  def self.search(column, word)
    return Customer.where("#{column} LIKE?","#{word}%").order("created_at DESC")
  end

  def self.search_pawn_data(word)
    if word == nil
      return nil
    else
      if Pawn.exists?(word)
        return Pawn.find(word)
      else
        return nil
      end
    end
  end

  def self.total_interest(pawn_id)
    if Interest.exists?(id: pawn_id)
      interests = Interest.where(pawn_id: pawn_id)
      total = 0
      interests.each do |data|
        total += data[:interests_number]
      end
      return total
    else
      return 0
    end
  end

end

class Pawn < ApplicationRecord
  belongs_to :customer
  has_many :interests

  with_options presence: true do
    validates :item_name
    validates :item_price, numericality: { other_than: 0 }, format: { with: /\A^[0-9]+\z/ }
    validates :item_detail
    validates :item_status
  end

  def self.search(column, word)
    return Pawn.where("#{column} LIKE?","#{word}%").order("created_at DESC")
  end
  def self.search_pawn_status(column, word, status)
    return Pawn.find_by("#{column} LIKE? and item_status = ?","#{word}%", status)
  end

  def self.where_pawn_status(column, word, status)
    return Pawn.where("#{column} LIKE? and item_status = ?","#{word}%", status)
  end

  def self.check_pawn_status(column, word, status)
    return Pawn.where("#{column} LIKE? and item_status = ?","#{word}%", status).exists?
  end
end

class Pawn < ApplicationRecord
  belongs_to :customer
  has_many :interests

  with_options presence: true do
    validates :item_name
    validates :item_price, numericality: { other_than: 0 }, format: { with: /\A^[0-9]+\z/ }
    validates :item_detail
    validates :item_status
  end
end

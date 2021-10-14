class Purchase < ApplicationRecord
  belongs_to :customer

  with_options presence: true do
    validates :buy_item_name
    validates :buy_item_price, numericality: { other_than: 0 }, format: { with: /\A^[0-9]+\z/ }
    validates :buy_item_detail
  end
end

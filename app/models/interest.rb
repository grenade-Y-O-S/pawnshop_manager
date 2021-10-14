class Interest < ApplicationRecord
  belongs_to :pawn

  with_options presence: true do
    validates :interests_number, numericality: { other_than: 0 }, format: { with: /\A^[0-9]+\z/ }
  end
end

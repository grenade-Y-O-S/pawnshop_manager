class Customer < ApplicationRecord
  has_many :pawns
  has_many :purchases

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana, format: { with: /\A^[ァ-ンヴー]+$\z/ }
    validates :first_name_kana, format: { with: /\A^[ァ-ンヴー]+$\z/ }
    validates :address
    validates :phone_number
    validates :birth_date
    validates :job
  end

  def self.search(column, word)
    if word != ""
      @customer = Customer.where("#{column} LIKE?","#{word}%")
    else
      @customer = nil
    end
  end

end

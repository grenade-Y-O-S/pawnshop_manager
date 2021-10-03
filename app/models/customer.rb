class Customer < ApplicationRecord
  has_many :pawns
  has_many :purchases

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :address
    validates :phone_number
    validates :birth_date
    validates :job
  end

  def self.search(column, search)
    if search != ""
      Customer.where('#{column} LIKE(?)', "%#{search}%")
    else
      Customer.all
    end
  end

end

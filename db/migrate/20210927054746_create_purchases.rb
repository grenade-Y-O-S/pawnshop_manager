class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string     :buy_item_name, null: false
      t.integer    :buy_item_price, null: false
      t.text       :buy_item_detail, null: false
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end

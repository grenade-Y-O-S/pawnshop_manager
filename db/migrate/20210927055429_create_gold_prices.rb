class CreateGoldPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :gold_prices do |t|
      t.integer :k18_price,    null: false
      t.integer :k14_price,    null: false
      t.integer :k24_price,    null: false
      t.integer :k18wg_price,  null: false
      t.integer :k14wg_price,  null: false
      t.integer :pt850_price,  null: false
      t.integer :pt900_price,  null: false
      t.integer :pt950_price,  null: false
      t.integer :pt1000_price, null: false
      t.timestamps
    end
  end
end

class CreatePawns < ActiveRecord::Migration[6.0]
  def change
    create_table :pawns do |t|
      t.string :item_name, null: false
      t.integer :item_price, null: false
      t.text :item_datail, null: false
      t.text :item_remarks
      t.integer :item_status, null: false
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end

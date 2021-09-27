class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.integer :interests_number, null: false
      t.references :pawn, foreign_key: true
      t.timestamps
    end
  end
end

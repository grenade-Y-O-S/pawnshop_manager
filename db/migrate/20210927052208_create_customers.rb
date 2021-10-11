class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :last_name,       null: false
      t.string :first_name,      null: false
      t.string :last_name_kana,  null: false
      t.string :first_name_kana, null: false
      t.string :address,         null: false
      t.date   :birth_date,      null: false
      t.string :phone_number,    null: false
      t.string :job,             null: false
      t.text   :remarks
      t.timestamps
    end
  end
end

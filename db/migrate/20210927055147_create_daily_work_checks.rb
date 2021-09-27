class CreateDailyWorkChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_work_checks do |t|
      t.time :message_time, null: false
      t.timestamps
    end
  end
end

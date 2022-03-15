class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.references :user, null: false, foreign_key: true
      t.references :financial_planner, null: false, foreign_key: true
      t.date :reserve_date
      t.integer :time_zone_code

      t.timestamps
    end
  end
end

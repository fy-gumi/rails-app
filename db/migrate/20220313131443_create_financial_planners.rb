class CreateFinancialPlanners < ActiveRecord::Migration[6.1]
  def change
    create_table :financial_planners do |t|
      t.string :financial_planner_name

      t.timestamps
    end
  end
end

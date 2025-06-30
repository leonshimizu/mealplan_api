class CreateMealPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :meal_plans do |t|
      t.string :title
      t.jsonb :recipes

      t.timestamps
    end
  end
end

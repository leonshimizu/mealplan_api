# db/seeds.rb
# -------------------------------------------------
# Clear existing data
MealPlan.destroy_all

# Helper that builds 21 recipe hashes for a given plan name
def recipes_for(plan)
  breakfasts = {
    balanced:  %w[Oatmeal_with_Berries Greek_Yogurt_Parfait Avocado_Toast Veggie_Omelette Smoothie_Bowl Chia_Pudding Banana_PeanutButter_Wrap],
    protein:   %w[Egg_White_Scramble Protein_Pancakes Cottage_Cheese_Bowl Turkey_Bacon_Omelette Overnight_Protein_Oats Quinoa_Porridge Smoked_Salmon_Bagel],
    vegan:     %w[Tofu_Scramble Peanut_Butter_Oatmeal Green_Smoothie Chia_Berry_Pudding Avocado_Lime_Toast Coconut_Yogurt_Granola Vegan_Breakfast_Burrito]
  }

  lunches = {
    balanced:  %w[Grilled_Chicken_Salad Quinoa_Bowl Turkey_Wrap Lentil_Soup Poke_Bowl Shrimp_Tacos Buddha_Bowl],
    protein:   %w[Steak_Spinach_Salad Chicken_Burrito_Bowl Tuna_Salad_Wrap Turkey_Chili Greek_Chicken_Pita Beef_Power_Bowl Salmon_Sushi_Burrito],
    vegan:     %w[Chickpea_Salad Falafel_Wrap Veggie_Sushi_Roll Lentil_Curry_Bowl Black_Bean_Burrito Sweet_Potato_Buddha_Bowl Hummus_Veggie_Sandwich]
  }

  dinners = {
    balanced:  %w[Baked_Salmon_Veggies Turkey_Meatballs_Quinoa StirFry_Chicken_BrownRice Veggie_Pasta Beef_Taco_Bowl Shrimp_StirFry Grilled_Pork_Chops],
    protein:   %w[Grilled_Sirloin_Veggies Baked_Cod_Lentils Chicken_StirFry_Edamame Turkey_Meatloaf_Spinach Chili_Lime_Shrimp_Kale Pork_Tenderloin_Quinoa Bunless_Turkey_Burger],
    vegan:     %w[Thai_Coconut_Curry Tempeh_StirFry Veggie_Paella Black_Bean_Chili Stuffed_Bell_Peppers Eggplant_Miso_Glaze Tofu_Poke_Bowl]
  }

  1.upto(7).flat_map do |day|
    [
      { day:, meal: "Breakfast", name: breakfasts[plan][day - 1] },
      { day:, meal: "Lunch",     name: lunches[plan][day - 1] },
      { day:, meal: "Dinner",    name: dinners[plan][day - 1] }
    ]
  end
end

meal_plans = [
  { title: "Balanced Nutrition Plan", key: :balanced },
  { title: "High-Protein Plan",       key: :protein  },
  { title: "Vegan Plan",              key: :vegan    }
]

meal_plans.each do |plan|
  MealPlan.create!(
    title:   plan[:title],
    recipes: recipes_for(plan[:key])
  )
end

puts "Seeded #{MealPlan.count} meal plans with #{MealPlan.first.recipes.size} recipes each."
# -------------------------------------------------

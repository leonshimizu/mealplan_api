class MealPlansController < ApplicationController
  def index
    meal_plans = MealPlan.all
    
    render json: meal_plans
  end

  def show
    meal_plan = MealPlan.find(params[:id])

    render json: meal_plan
  end

  def create
    meal_plan = MealPlan.new(
      title: params[:title],
      recipes: params[:recipes]
    )

    meal_plan.save

    render json: meal_plan
  end

  def update
    meal_plan = MealPlan.find(params[:id])

    meal_plan.update(
      title: params[:title] || meal_plan.title,
      title: params[:recipes] || meal_plan.recipes
    )

    render json: meal_plan
  end

  def destroy
    meal_plan = MealPlan.find(params[:id])
    meal_plan.destroy
  
    render json: { message: "Meal Plan was destroyed" }
  end
end

Rails.application.routes.draw do
  get "/meal_plans" => "meal_plans#index"
  get "/meal_plans/:id" => "meal_plans#show"
  post "/meal_plans" => "meal_plans#create"
  patch "/meal_plans/:id" => "meal_plans#update"
  delete "/meal_plans/:id" => "meal_plans#destroy"
end

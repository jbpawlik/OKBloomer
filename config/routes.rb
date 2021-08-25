Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  get '/home', to: "homes#index"
  root to: "homes#index"
  get '/plants/tasks', to: "plants#tasks"
  post '/plants/:id/water_update', to: "plants#water_update"
  resources :plants
end

Rails.application.routes.draw do

  root to: 'employee#index'
  get 'employee/index'
  get 'employee/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

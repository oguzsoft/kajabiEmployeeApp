Rails.application.routes.draw do

  root to: 'employee#index'
  get 'employee/index'
  get 'employee/show'
  get 'employee/getEmps'
  get '/employee/:id', to: 'employee#show'
  #resources :employee
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

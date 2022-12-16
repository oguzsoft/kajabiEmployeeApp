Rails.application.routes.draw do

  root to: 'employee#index'
  get 'employee/index'
  get 'employee/show'
  get 'employee/getEmps/:id', to: 'employee#getEmps'
  get 'employee/getUserInformation/:id', to: 'employee#getUserInformation'
  get 'employee/searchedData/:parameter', to: 'employee#searchedData'
  get 'employee/totalPages', to: 'employee#totalPages'
  get '/employee/:id', to: 'employee#show'
end

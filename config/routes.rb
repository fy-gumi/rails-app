Rails.application.routes.draw do
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root :to => 'home#index'
  
  resources :financial_planners
  resources :users

  post   '/users/:id',  to: 'users#login'
  post   '/financial_planners/:id',  to: 'financial_planners#login'

end

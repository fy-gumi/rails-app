Rails.application.routes.draw do
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root :to => 'home#index'

  resources :financial_planners
  resources :users

  get   '/user/home',  to: 'users#home'
  get   '/financial_planner/home',  to: 'financial_planners#home'
  post   '/users/:id',  to: 'users#login'
  post   '/financial_planners/:id',  to: 'financial_planners#login'
end

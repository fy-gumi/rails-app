Rails.application.routes.draw do
  resources :reserves
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root :to => 'home#index'

  resources :financial_planners
  resources :users

  get   '/user/home',  to: 'users#home'
  get   '/financial_planner/home',  to: 'financial_planners#home'

  post   '/user/reserve',  to: 'users#reserve'
  post   '/financial_planner/insert',  to: 'financial_planners#insert'

  post  '/users/:id',  to: 'users#login'
  post  '/financial_planners/:id',  to: 'financial_planners#login'
end

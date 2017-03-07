Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root "welcome#home", as: "home_page"

  get "/company_search"    =>  "quotes#search_form_yahoo_yql", as: "search_company"

  post "/quotes"          =>  "quotes#index"

  get "/users/:id" =>  "users#show", as: "user"





  resources :stocks
  resources :quotes
  resources :portfolios


end

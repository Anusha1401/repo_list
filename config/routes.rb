Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'lists', to: 'lists#index'
  get '/search', to: 'lists#search', as: 'search'
end

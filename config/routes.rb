Rails.application.routes.draw do
  get 'login/create'
  resources :users
  resources :journals
  resources :entries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

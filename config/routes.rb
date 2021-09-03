Rails.application.routes.draw do
  get 'login/create'
  resources :journals
  resources :entries

  resources :users do
    resources :entries
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

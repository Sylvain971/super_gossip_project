Rails.application.routes.draw do
  get 'home/index'

  post '/gossips/new', to: 'gossips#create'

  root 'home#index'

  resources :gossips

  devise_for :moussaillons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

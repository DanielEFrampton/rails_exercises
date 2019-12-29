Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dogs do
    resources :tricks, only: [:index, :new, :create]
  end

  get '/hello', to: 'nonrestful#hello'
  get '/greetings/:name', to: 'nonrestful#what_is_your_name'
  patch '/items/:the_item_id/deactivate', to: 'nonrestful#deactivate'
  delete '/subtract/:x/from/:y', to: 'nonrestful#subtract', as: 'subtract'

  namespace :admin do
    resources :users, only: [:show]
    resources :dogs, only: [:index] do
      resources :tricks, only: [:index]
    end
    resources :tricks, only: [:destroy]
  end
end

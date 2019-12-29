Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dogs do
    resources :tricks, only: [:index, :new, :create]
    resources :owners, only: [:create, :new]
  end

  resources :owners, only: [:index]

  get '/owners/:owner_id/dogs/adopt', to: 'owners#adoption'
  post '/owners/:owner_id/dogs/:dog_id', to: 'owners#adopt'
  post '/owners/:owner_id/dogs', to: 'owners#adopt_from_list'
end

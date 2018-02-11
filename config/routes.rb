Rails.application.routes.draw do

  root 'static_pages#home'

  get '/index',        to: 'users#index'
  get  '/signup',      to: 'users#new'
  post '/signup',      to: 'users#create'

  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'

  get  '/new_event',   to: 'events#new'
  post '/new_event',   to: 'events#create'
  post '/subscribe',   to: 'events#subscribe'

  resources :users
  resources :events do
    get '/users',        to: 'users#index'
    get '/users/invite', to: 'events#invite'
  end
end

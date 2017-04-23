Rails.application.routes.draw do
  resources :accounts
  namespace :v1 do
    resources :organizers
    resources :cities
    resources :topics
    resources :profiles
    resources :events
    resources :sessions, only: [:create]
    resources :registrations, only: [:create, :show]
    post '/events/:id', to: 'events#update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

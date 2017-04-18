Rails.application.routes.draw do
  resources :accounts
  namespace :v1 do
    resources :organizers
    resources :cities
    resources :topics
    resources :profiles
    resources :events
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

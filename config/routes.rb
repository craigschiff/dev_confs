Rails.application.routes.draw do
  namespace :v1 do
    resources :organizers, only:[:index,:show]
    resources :cities, only:[:index,:show]
    resources :topics, only:[:index,:show]
    resources :events, only:[:index,:show,:create] do
      resources :comments, only:[:create]
    end
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    post '/events/:id', to: 'events#update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

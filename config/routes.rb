Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :registrations, only: [:create]
      delete :logout, to: "sessions#logout"
      get :logged_in, to: "sessions#logged_in"
      resources :needs, only: [:create, :index]
      resources :fulfillments, only: [:create, :index]
      resources :conversations, only: [:create, :index, :show]
      resources :messages, only: [:create, :index, :show]
      
    end
  end
  
  root to: "static#home"
end

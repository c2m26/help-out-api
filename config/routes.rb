Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :registrations, only: [:create]
      delete :logout, to: "sessions#logout"
      get :logged_in, to: "sessions#logged_in"
      
      resources :needs, only: [:create, :index]
      namespace :needs do
        get :get_creatorID
      end

      resources :fulfillments, only: [:create, :index]
      namespace :fulfillments do
        get :get_foreignKeys
      end
      resources :conversations, only: [:create, :index, :show]
      resources :messages, only: [:create, :index, :show]
      
    end
  end
  
  root to: "static#home"
end

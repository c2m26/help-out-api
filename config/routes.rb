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
        get :get_userNeeds
        get :get_openNeeds
      end

      resources :fulfillments, only: [:create, :index]
      namespace :fulfillments do
        get :get_foreignKeys
        get :get_userFulfillments
      end
      
      resources :conversations, only: [:create, :index]
      namespace :conversations do
        get :getID
      end

      resources :messages, only: [:create, :index]
      namespace :messages do
        get :get_Messages
      end
      
    end
  end
  
  root to: "static#home"
end

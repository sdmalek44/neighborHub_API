Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :neighborhoods, only: [:index, :show]
      resources :projects, only: [:index, :update] do
        get '/comments', to: 'projects/comments#index'
      end

      resources :users, only: [:index, :show] do
        get '/projects', to: 'users/projects#index'
        post '/projects', to: 'users/projects#create'
      end

      post '/users', to: 'google_users#create'
    end
  end
end

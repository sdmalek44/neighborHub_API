Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :neighborhoods, only: [:index, :show]
      resources :projects, only: [:index, :update] do
        get '/comments', to: 'projects/comments#index'
        post '/comments', to: 'projects/comments#create'
      end

      resources :users, only: [:index, :show, :update] do
        get '/projects', to: 'users/projects#index'
        post '/projects', to: 'users/projects#create'
      end

      post '/google_users', to: 'google_users#create'
      post '/users', to: 'users#create'
    end
  end
end

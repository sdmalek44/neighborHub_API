Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :neighborhoods, only: [:index, :show]
      resources :projects, only: [:index, :update]

      resources :users, only: [:index] do
        get '/projects', to: 'users/projects#index'
        post '/projects', to: 'users/projects#create'
      end
    end
  end
end

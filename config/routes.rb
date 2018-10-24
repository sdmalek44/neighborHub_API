Rails.application.routes.draw do

  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :neighborhoods, only: [:index]
      resources :projects, only: [:index]
    end
  end

end

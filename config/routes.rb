Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :neighborhoods, only: [:index]
    end
  end

  # get '*other', to: redirect('/')
end

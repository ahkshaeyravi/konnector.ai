Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create] do
        collection do
          get 'filter'
        end
      end
    end
  end

end

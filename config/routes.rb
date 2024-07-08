Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#hello'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :filter_users]
    end
  end

end

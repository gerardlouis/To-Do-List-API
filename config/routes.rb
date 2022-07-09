Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :td_lists, only: [:index, :show, :create, :destroy]
      resources :td_categories, only: [:show, :create, :destroy]
      resources :td_list_items, only: [:show, :create, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

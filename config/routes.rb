Rails.application.routes.draw do
  resources :tags
  resources :categories
  resources :topics
  resources :sites
  scope :api do
    resources :users, only: %i[create show update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

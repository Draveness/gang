Rails.application.routes.draw do
  scope :api do
    resources :users, only: %i[create show update]
    resources :tags, except: %i[destroy]
    resources :categories, except: %i[destroy]
    resources :sites, except: %i[destroy]
    resources :topics, except: %i[destroy] do
      resources :subtopics, controller: 'topics/subtopics'
    end
  end
end

Rails.application.routes.draw do
  scope :api do
    resources :users, only: %i[index create show update]
    resources :enrolls, except: %i[destroy]
    resources :likes, except: %i[destroy]

    resources :sites, except: %i[destroy]

    resources :tags, except: %i[destroy]
    resources :categories, except: %i[destroy]
    resources :topics, except: %i[destroy] do
      resources :subtopics, controller: 'topics/subtopics'
    end

    resources :activities, except: %i[destroy]
  end
end

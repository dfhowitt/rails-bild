Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show] do
    get "dashboard", to: "users#dashboard"
    get "application", to: "users#application"
    get "qualification", to: "users#qualification"
    get "history", to: "users#history"
    get "schedule", to: "users#schedule"
    # get "my_placements", to: "users#my_placements"
    # get "sites", to: "users#sites"
    # get "placements", to: "users#placements"
    # get "projects", to: "users#projects"
    resources :user_qualifications, only: [:create]
      resources :conversations, only: [:index] do
        resources :messages, only: [:index, :create]
    end
  end

  resources :user_qualifications, only: [:destroy]

  resources :sites, except: [:index] do
    resources :projects, only: [:new, :create]
  end

  get 'projects/map', to: "projects#map_index"
  get 'projects/combined', to: "projects#combined_index"

  resources :projects, except: [:new, :create] do
    resources :placements, only: [:create, :update]
  end


  resources :placements, only: [:destroy] do
    resources :conversations, only: [:create]
  end
end

# def dashboard
#   @applications
# end

# <% render 'applications' %>

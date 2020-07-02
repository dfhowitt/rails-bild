Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "about-us", to: "pages#about_us"

  resources :users, only: [:show, :edit, :update] do
    get "dashboard", to: "users#dashboard"
    get "application", to: "users#application"
    get "qualification", to: "users#qualification"
    get "history", to: "users#history"
    get "schedule", to: "users#schedule"
    get "timesheet", to: "users#timesheet"
    get "manager_history", to: "users#manager_history"

    get "business", to: "users#business"
    get "manager_business", to: "users#manager_business"
    get "profile", to: "users#profile"



    # get "my_placements", to: "users#my_placements"
    # get "sites", to: "users#sites"
    # get "placements", to: "users#placements"
    # get "projects", to: "users#projects"
    resources :user_qualifications, only: [:create]
    resources :conversations, only: [:index] do
      resources :messages, only: [:index, :create]
    end
  end

  resources :user_qualifications, only: [:destroy], as: :qualification_destroy

  resources :sites, except: [:index] do
    resources :projects, only: [:new, :create]
  end

  get 'projects/map', to: "projects#map_index"
  get 'projects/combined', to: "projects#combined_index"

  resources :projects, except: [:new, :create] do
    resources :placements, only: [:create, :update]
  end

  resources :businesses, only: [:create, :edit, :destroy] do
    resources :employments, only: [:create, :index]
  end

  resources :employments, only: [:destroy]



  get 'employeesearchcreate', to: "employments#search_create", as: "employee_search"
  post 'employeesearchcreate', to: "employments#search_create"
  get 'teamcreate', to: "placements#team_create", as: "team_placement"
  post 'teamcreate', to: "placements#team_create"
  resources :placements, only: [:destroy, :create] do
    resources :conversations, only: [:create]
  end
end

# def dashboard
#   @applications
# end

# <% render 'applications' %>

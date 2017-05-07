Rails.application.routes.draw do

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'

    authenticated :user do
      root 'goals#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end

  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'job_applications/[:params]', to: 'job_applications#search_job_apps', as: 'search_job_apps'
  resources :users, :only => [:show]
  resources :goals, :except => [:destroy]
  resources :questions, :except => [:show]
  resources :job_applications, :interviews

end

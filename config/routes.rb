Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root to: 'welcomes#index'
  
  resources :welcomes, only: :index
  resources :homes, only: :index
  resources :users, only: :show
  resources :materials do
    member do
      get :download
    end
  end
  resources :articles
  resources :questions

end

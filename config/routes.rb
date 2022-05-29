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
    resources :feedbacks, only: :create
  end
  resources :articles do
    resources :comments, only: :create
  end 
  resources :questions do
    resources :answers, only: :create
  end
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end

end

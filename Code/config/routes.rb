Rails.application.routes.draw do
  get '/' => 'home#index'

  resources :users do
    member do
      post :follow
      delete :unfollow
    end
    resources :photos, only: [:index, :new, :create, :show]
  end

  resources :photos, only: [:destroy] do
    resources :comments, only: [:create, :destroy]
    member do
      get :comments # Route για να επιστρέφονται τα σχόλια μέσω Ajax
    end
  end

  resources :tags, only: [:create, :destroy]
  
  get '/log-in' => "sessions#new"
  post '/log-in' => "sessions#create"
  get '/log-out' => "sessions#destroy", as: :log_out
end
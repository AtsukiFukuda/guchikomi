Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts do 
  resources :likes, only: [:create, :destroy]
  resources :cheers, only: [:create, :destroy]
  resources :forgets, only: [:create, :destroy]
  resources :talks, only: [:create]
  resources :comments, only: [:create, :destroy]
  end
  resources :users, :only => [:index, :new, :create, :show, :edit, :update]
  resources :groups, only: [:new, :create, :edit, :update]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

end


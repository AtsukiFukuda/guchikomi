Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#追加箇所
  #Tweetの投稿に関するページ
  #投稿ページ表示
  
  #ここまで
  root 'posts#index'
  resources :posts do 
    resources :likes, only: [:create, :destroy]
  end
  resources :users, :only => [:index, :new, :create, :show, :edit, :update]

  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

end


Rails.application.routes.draw do



  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    collection do
      get :taketexts
      #自分の受け取ったletter一覧を取得
      get :givetexts
      #自分が送ったletter一覧を取得
      get :takeusers
      #自分がletterを送ったuserの一覧を取得する
    end
  end
  
  resources :postletters, only: [:create, :destroy, :update, :edit]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  resources :choice, only: [:index, :show]
  resources :lies, only: [:index, :show]
  resources :truths, only: [:index, :show]
  resources :trueletter, only: [:show]
  resources :ookamiletter, only: [:show]
  resources :ookamiproduction, only: [:show]
  resources :trueproduction, only: [:show]
  
  
  get 'gaide', to: 'gaides#index'
  get 'wait', to: 'wait#index'
  
  resources :takeletters, only: [:index, :show, :edit]
  
  
end

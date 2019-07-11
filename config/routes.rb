Rails.application.routes.draw do




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
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
  resources :secrets, only: [:create, :destroy, :update, :edit]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'passwordlogin', to: 'passwordlogin#new'
  post 'passwordlogin', to: 'passwordlogin#create'
  
  get 'users/:id/new', to: 'users#new', as: 'sign'
  get 'sessions/:id/new', to: 'sessions#new', as: 'loginsession'
  
  
  
  resources :choice, only: [:index, :show]
  resources :lies, only: [:index, :show]
  resources :truths, only: [:index, :show]
  resources :trueletter, only: [:show]
  resources :ookamiletter, only: [:show]
  resources :ookamiproduction, only: [:show]
  resources :trueproduction, only: [:show]
  resources :ookamigaide, only:[:index, :show]
  resources :truegaide, only:[:index, :show]
  resources :sendgaideletter,only:[:index, :show]
  resources :secret, only:[:index, :show]
  resources :looksecret, only:[:index, :show]
  resources :back, only:[:index]
  resources :friends, only:[:index, :show, :create, :destroy]
  resources :friendcreate, only:[:index, :show]
  resources :friendcamera, only:[:index, :show]
  resources :profileedit, only:[:index, :show]
  resources :passfinish, only:[:index,:show]
  resources :takeletters, only: [:index, :show, :edit]
  resources :lookfriend, only:[:index,:show]
  resources :fromthink, only:[:index,:show, :create]
  resources :thinks, only:[:create]
  resources :thinkfinish, only:[:index,:show]
  resources :ask, only:[:index]
  resources :recoms,only:[:index, :show, :create]
  resources :recomfinish, only:[:show]
  resources :takethink, only:[:index, :show]
  resources :takerecom, only:[:index, :show]
  resources :letterfinish, only:[:index,:show]
  resources :ookamifinish, only:[:index,:show]
  resources :takedthink, only:[:show,:edit]
  resources :takedrecom, only:[:show,:edit]
  resources :responses, only:[:index, :show, :create, :destroy, :update, :edit ]
  resources :letsletter,only:[:index, :show]
  resources :toletter,only:[:show, :index]
  resources :changeletters, only:[:index, :show, :create, :destroy, :update, :edit ]
  resources :lookletter, only:[:show]
  resources :reply,only:[:show, :index]
  resources :lettersended, only:[:show]
  resources :newletter, only:[:show]
  resources :fromletter, only:[:show]
  resources :takesendgaide,only:[:show]
  resources :gaideaccount, only:[:index]
  resources :lettergaide,  only:[:show]
  resources :gaide1, only:[:index]
  resources :gaide2, only:[:index]
  resources :gaide3, only:[:index]
  resources :delete, only:[:index]
  resources :questionsend, only:[:show]
  resources :notice1, only:[:show]
  resources :notice2, only:[:show]
  resources :notice3, only:[:show]
  resources :notice4, only:[:show]
  resources :notice5, only:[:show]
  resources :notice6, only:[:show]
  resources :notice7, only:[:show]
  resources :notice8, only:[:show]
  resources :notice9, only:[:show]
  resources :notice10, only:[:show]
  resources :notice11, only:[:show]
  resources :notice12, only:[:show]
  resources :notice13, only:[:show]
  
end

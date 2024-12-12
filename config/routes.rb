Rails.application.routes.draw do
  devise_for :users

  #delete通信のはずなのに、getがないとエラーがおきてしまうので追加
  #devise_scope :user do
    # link_toで　method: :deleteを:destroyと勘違いしてしまっていたので注意
    # get '/users/sign_out' => 'devise/sessions#destroy'
    # post '/users/sign_out' => 'devise/sessions#destroy'
  #end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  root "articles#index"

  #リソースベースのルーティング（以下リソースルーティング）を使うことで、指定のリソースコントローラでよく使われるすべてのルーティングを手軽に宣言できます。
  #resourcesを宣言するだけで、コントローラのindex、show、new、edit、create、update、destroyアクションを個別に宣言しなくても1行で宣言が完了します。
  resources :articles, only: [:index, :show, :new, :create, :update, :destroy] do
    member do
      get :toggle_like
      post :toggle_like
    end
  end

  resources :categories, only: [:index] do
    collection do
      get :select
    end
  end
  resources :subcategories, only: [:show] do
    collection do
      get :select
    end
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]

  resources :users, only: [:index, :show] do
    member do
      get :followings, :followers
    end
    resource :relationships, only: [:create, :destroy] do
      get :create
    end
  end
end

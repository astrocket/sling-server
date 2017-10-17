Rails.application.routes.draw do

  namespace :users do
    post 'facebook_callbacks/facebook'
  end

  namespace :member do
    resources :groups, only: [:index, :show] do
      collection do
        get :my_index
        get :search
      end
      member do
        get :my_index_show
        post :join
      end
    end
    resources :activities, only: [:index, :show] do
      collection do
        get :my_index
      end
    end
    resources :spots, only: [:index, :show] do
      collection do
        get :my_index
      end
      member do
        post :join
      end
    end
    get 'home/index'
  end

  namespace :manager do
    resources :groups
  end

  resources :posts
  get 'home/index'

  get 'paygate/payform'
  post 'paygate/gateway'
  post 'paygate' => 'paygate#create'

  devise_for :users, defaults: { format: 'json' } # 로 해주면 무조건 라우팅이 json 기준으로 되게 된다.
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

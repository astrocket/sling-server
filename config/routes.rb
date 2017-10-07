Rails.application.routes.draw do

  get 'home/index'

  namespace :member do
    get 'home/index'
  end

  devise_for :users, defaults: { format: 'json' } # 로 해주면 무조건 라우팅이 json 기준으로 되게 된다.
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

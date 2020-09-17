Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root :to =>'photos#feed', as: :authenticated_root
    end

    unauthenticated do
      root :to => 'photos#guest', as: :unauthenticated_root
    end
  end

  resources :users, only: :show do
    resources :photos, :albums, only: [:new, :create]
  end

  resources :photos, :albums, only: [:edit, :update, :destroy] do
    collection do
      get 'feed'
      get 'discover'
      get 'guest'
    end
  end

  post 'follow', to: 'users#follow'
  post 'like', to: 'users#like'

  namespace :admin do
    resources :albums, except: [:new, :create, :show]
    resources :photos, except: [:new, :create, :show]
    resources :users, except: [:new, :create, :show]
  end
end

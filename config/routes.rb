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
    resources :photos, :albums, only: :index
  end

  resources :photos ,except: ['show'] do
    collection do
      get 'feed'
      get 'discover'
      get 'guest'
    end
  end

  resources :albums ,except: ['show'] do
    collection do
      get 'feed'
      get 'discover'
      get 'guest'
    end
  end

  namespace :admin do
    resources :users, shallow: true
  end
end

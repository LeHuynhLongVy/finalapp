Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :photos
  resources :albums
  root 'home#guest_feed_photo'
  # root 'welcome#index'
  get 'signup', to: 'home#signup'
  get 'login', to: 'home#login'
  get 'feed/photo', to: 'home#feed_photo'
  get 'feed/album', to: 'home#feed_album'
  get 'discover/photo', to: 'home#discover_photo'
  get 'discover/album', to: 'home#discover_album'
  get 'newest', to: 'home#newest'
  get 'guestphoto', to: 'home#guest_feed_photo'
  get 'guestalbum', to: 'home#guest_feed_album'
end

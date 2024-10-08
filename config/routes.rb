Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    post 'users/wallet_auth/callback', to: 'users/sessions#solana_auth'
  end

  resources :sites
  resources :users
  resources :payments
  resources :collections
  post 'collections/mint/:id', to: 'collections#mint'

  get 'dashboard', to: 'dashboard#index'
  post 'dashboard/log_click', to: 'dashboard#log_click'

  get 'nft_creator/one_of_one', to: 'nft_creator#index', type: 'one_of_one'
  get 'nft_creator/limited_edition', to: 'nft_creator#index', type: 'limited_edition'
  get 'nft_creator/open_edition', to: 'nft_creator#index', type: 'open_edition'
  get 'nft_creator/music', to: 'nft_creator#index', type: 'music'
  get 'nft_creator/video', to: 'nft_creator#index', type: 'video'
  get 'nft_creator/concert', to: 'nft_creator#index', type: 'concert'
  get 'nft_creator/fan_card', to: 'nft_creator#index', type: 'fan_card'
  get 'nft_creator/free_mint', to: 'nft_creator#index', type: 'free_mint'
  get 'nft_creator/generic_nft', to: 'nft_creator#index', type: 'generic_nft'
  get 'website_creator/one_of_one', to: 'website_creator#index', type: 'one_of_one'
  get 'website_creator/limited_edition', to: 'website_creator#index', type: 'limited_edition'
  get 'website_creator/open_edition', to: 'website_creator#index', type: 'open_edition'
  get 'website_creator/music', to: 'website_creator#index', type: 'music'
  get 'website_creator/video', to: 'website_creator#index', type: 'video'
  get 'website_creator/concert', to: 'website_creator#index', type: 'concert'
  get 'website_creator/fan_card', to: 'website_creator#index', type: 'fan_card'
  get 'website_creator/free_mint', to: 'website_creator#index', type: 'free_mint'
  get 'website_creator/generic_nft', to: 'website_creator#index', type: 'generic_nft'
  get 'nft_creator', to: 'nft_creator#index'
  get 'website_creator', to: 'website_creator#index'
  get 'website_creator/flight', to: 'website_creator#flight'
  get 'website_creator/fan_card', to: 'website_creator#fan_card'

  # get 'about_page', to: 'about_page#index'
  # get 'contact_page', to: 'contact_page#index'
  get 'tokengating', to: 'tokengating#index'
  get 'blink', to: 'blink#index'

  get 'help', to: 'help#index'
  get 'transactions', to: 'transactions#index'
  get 'credits', to: 'credits#index'

  post 'payments/create_payment_intent', to: 'payments#create_payment_intent'
  post 'payments/create_crypto', to: 'payments#create_crypto'

  post 'sites/retry', to: 'sites#retry'

  # Defines the root path route ("/")
  root 'dashboard#index'
end

Rails.application.routes.draw do
  
  root to: "posts#top"
  
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      confirmations: 'users/confirmations',
      mailer: 'users/mailer'
    }
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :views, only: [:create]
    resources :comments, only: [:create, :destroy]
    
    collection do
      match 'search' => 'posts#search', via: [:get, :post], as: :search
    end
  end
  
  resources :users, only: [:show, :update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

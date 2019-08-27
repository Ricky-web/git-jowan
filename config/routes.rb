Rails.application.routes.draw do
  
  root to: "posts#index"
  
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
    }
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :views, only: [:create]
    resources :comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

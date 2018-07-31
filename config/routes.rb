Rails.application.routes.draw do
  devise_for :users
  resources :locations do
    collection do
      get 'search'
    end
  end
  resources :trips do
    collection do
      get 'search'
      get 'article'
    end
  end

  mount Lockup::Engine, at: '/lockup'

  root to: 'trips#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

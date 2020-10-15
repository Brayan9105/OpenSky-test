Rails.application.routes.draw do
  root 'home#index'
  resources :posts
  
  get '/logs', to: 'applogs#index'

  resources :authors
  get '/posts/:id/author', to: 'posts#authorPost', as: 'authorPost'
  
  namespace :api do
    namespace :v1 do
      resources :authors
      resources :posts
    end
  end
end

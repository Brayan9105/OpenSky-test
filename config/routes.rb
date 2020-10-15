Rails.application.routes.draw do
  root 'home#index'
  resources :posts
  
  get '/logs', to: 'applogs#index'

  resources :authors
  get '/posts/:id/author', to: 'posts#authorPost', as: 'authorPost'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

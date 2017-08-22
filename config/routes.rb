Rails.application.routes.draw do

  devise_for :users

  resources :posts do
    resources :comments
  end

  root "posts#index"

  get '/about', to: "pages#about"
  get '/hashtags', to: "pages#hashtags"

  get 'users/:id/posts' => 'users#posts', :as => :user_posts

  get 'tags/:tag', to: 'posts#index', as: :tag

end

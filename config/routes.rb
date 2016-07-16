Rails.application.routes.draw do
  get '/home', to: 'pages#home' 
  root :to => "pages#home"
  resources :recipes do
    member do
      post 'like'
    end
  end
  
  resources :chefs, except: [:new, :destroy]
  
  resources :reviews, only: [:create,:update]
  get 'new/:recipe_id', to: 'reviews#new', as: 'new_review'
  get 'index/:recipe_id', to: 'reviews#index', as: 'all_reviews'
  get 'edit/:id', to: 'reviews#edit', as: 'edit_review'
  
  get '/register', to: 'chefs#new'
  
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
end

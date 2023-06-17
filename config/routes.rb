Rails.application.routes.draw do
  post '/login', to: 'users#login'
  post '/signup', to: 'users#signup'
  resources :cats
  get '/search', to: 'cats#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

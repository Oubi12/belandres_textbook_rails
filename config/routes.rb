Rails.application.routes.draw do
  get 'feedbacks/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  get :home, to:'welcome#home'
  get :about, to: 'welcome#about'
  get :contact, to: 'feedbacks#index'
  resources :feedbacks
  resources :posts
end
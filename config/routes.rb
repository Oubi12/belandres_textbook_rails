Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  get :home, to: 'welcome#home'
  get :about, to: 'welcome#about'
  get :contacts, to: 'welcome#contacts'
  get :categorys, to: 'welcome#categorys'
  resources :feedbacks
  resources :posts do
    resources :comments, except: :show
  end
  resources :categories, except: :show

end
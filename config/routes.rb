Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'welcome#index'
  get :home, to: 'welcome#home'
  get :about, to: 'welcome#about'
  get :contacts, to: 'welcome#contacts'
  get :categorys, to: 'welcome#categorys'

  resources :feedbacks do
    resources :notes, except: :show
  end

  resources :posts do
    resources :comments, except: :show
  end

  resources :categories, except: :show

  namespace :api do
    resources :news, only: :index

    namespace :v1 do
      resources :regions, only: %i[index show], defaults: { format: :json } do
        resources :provinces, only: :index, defaults: { format: :json }
      end
      resources :provinces, only: %i[index show], defaults: { format: :json } do
        resources :cities, only: :index, defaults: { format: :json }
      end
      resources :cities, only: %i[index show], defaults: { format: :json } do
        resources :barangays, only: :index, defaults: { format: :json }
      end
      resources :barangays, only: %i[index show], defaults: { format: :json }
    end
  end

  resources :cat_facts, only: [:index] do
    post 'fetch_catfact', on: :collection
  end

  resources :random_users, only: [:index] do
    post 'fetch_random_user', on: :collection
  end
end
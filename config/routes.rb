Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  #root 'aplication#hello'
  resources :articles#, only: [:show, :index, :new, :create, :edit, :update, :destroy]

end


Rails.application.routes.draw do
  ##credentials for user
  devise_for :users
  #resources :images, :videos
#  resources :articles do
#    resources :comments
  #end

  resources :articles do
    resources :comments
  end

  resources :landings, only: [:_form, :edit, :index, :new, :show]
  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :items, only: [:_form, :edit, :index, :new, :show]
  resources :articles, only: [:_form, :edit, :index, :new, :show]
  resources :current_account, only: [:_form, :edit, :index, :new, :show]
  resources :lectures, only: [:_form, :edit, :index, :new, :show]
  resources :comments, only: [:_comment, :form]

  #resources :current_account, only: [:index]

  mount ActionCable.server => '/cable'

  root 'landings#index'
#  root 'articles#index'
end

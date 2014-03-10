Tom::Application.routes.draw do

  resources :vendors, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  resources :addresses, only: [:create, :update, :destroy]  

  root 'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'

end

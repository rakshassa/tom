Tom::Application.routes.draw do

  resources :vendors do
  	member do
  		put :create_address
  	end
  end

  resources :addresses, only: [:create, :update, :destroy]  

  root 'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  #match '/vendors/:id/create_address' to: 'vendors#create_address', via: 'post'

end

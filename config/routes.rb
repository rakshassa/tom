Tom::Application.routes.draw do

  resources :vendors

  root 'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'

end

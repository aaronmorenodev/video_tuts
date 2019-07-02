Rails.application.routes.draw do
  get 'users/new'
  get 'help' => 'static_pages#help'
  get 'contact' => 'static_pages#contact'
  get 'static_pages/about'
  get 'signup' => 'users#new'
  root 'static_pages#home'
end
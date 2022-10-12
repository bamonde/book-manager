Rails.application.routes.draw do
  root 'books#index'

  resources :books, param: :id
end

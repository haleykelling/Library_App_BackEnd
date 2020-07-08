Rails.application.routes.draw do
  resources :saved_books
  resources :users, only: [:create]
  post 'login', to: 'authentication#login'
  get 'book_search', to: 'books#index'
  post 'save_book', to: 'books#save'
end

Rails.application.routes.draw do
  resources :friends, only: [:index]
  resources :saved_books, only: [:index, :update, :destroy]
  resources :users, only: [:create]
  post 'login', to: 'authentication#login'
  get 'book_search', to: 'books#index'
  post 'save_book', to: 'books#save'
  get 'bookshelves', to: 'saved_books#index'
end

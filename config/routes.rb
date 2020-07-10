Rails.application.routes.draw do
  resources :friends, only: [:index]
  resources :saved_books, only: [:index, :update, :destroy]
  resources :users, only: [:create]
  post 'login', to: 'authentication#login'
  get 'book_search', to: 'books#index'
  get 'title_search', to: 'books#title_search'
  get 'author_search', to: 'books#author_search'
  post 'save_book', to: 'books#save'
  get 'bookshelves', to: 'saved_books#index'
end

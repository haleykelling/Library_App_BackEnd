class SavedBooksController < ApplicationController
  include Bookshelf  
  before_action :authenticate, only: [:index, :update, :destroy]

    def index 
        @saved_books = SavedBook.where(user_id: @user.id)
        @organized = organize_by_bookshelf(@saved_books)
        render json: @organized, include: [:book]
    end

    def update 
      @saved_book = SavedBook.find(params[:id])
      @saved_book.update(bookshelf: params[:bookshelf])
    end

    def destroy
      @saved_book = SavedBook.find(params[:id])
      @saved_book.destroy
    end

end

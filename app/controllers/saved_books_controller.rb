class SavedBooksController < ApplicationController
    before_action :authenticate, only: [:index, :update, :destroy]

    def index 
        @saved_books = SavedBook.where(user_id: @user.id)
        @organized = organize_by_bookshelf(@saved_books)
        render json: @organized, include: [:book]
    end

    def organize_by_bookshelf(array)
        organized_hash = {
          to_read: [],
          reading: [],
          previously_read: []
        }
        array.each do |saved_book_instance|
          if saved_book_instance.bookshelf == 1
            organized_hash[:to_read] << saved_book_instance
          elsif saved_book_instance.bookshelf == 2
            organized_hash[:reading] << saved_book_instance
          elsif saved_book_instance.bookshelf == 3
            organized_hash[:previously_read] << saved_book_instance
          end
        end
        return organized_hash
    end

    def update 
      @saved_book = SavedBook.find(params[:id])
      @saved_book.update(bookshelf: params[:bookshelf])
      render json: @saved_book
    end

    def destroy
      @saved_book = SavedBook.find(params[:id])
      if @saved_book.destroy
        render json: {message: "Book has been deleted"}
      else
        render json: {error: "Book wasn't deleted"}, status: :forbidden
      end
    end

end

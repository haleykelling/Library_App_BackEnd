class BooksController < ApplicationController
    before_action :authenticate, only: [:save]
    
    def index
        render json: BookSerializer.new(BookFacade.new(params[:search]))
    end

    def save
        @book = Book.find_by(isbn_13: book_params[:isbn_13])
        if !@book
            @book = Book.create(book_params)
        end

        @saved_book = SavedBook.where(user_id: @user.id, book_id: @book.id)
        if @saved_book == []
            @saved_book = SavedBook.create(
                user_id: @user.id,
                book_id: @book.id,
                bookshelf: 1
            )
        end
        render json: @saved_book, include: [:user, :book]
    end


    private

    def book_params
        params.require(:book).permit(
            :title, 
            :authors, 
            :published_date, 
            :description, 
            :page_count, 
            :categories, 
            :image_link, 
            :isbn_13
        )
    end

end

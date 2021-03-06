class BooksController < ApplicationController
    before_action :authenticate, only: [:save]
    
    def index
        render json: BookSerializer.new(BookFacade.new(params[:search], 'default'))
    end

    def title_search
        render json: BookSerializer.new(BookFacade.new(params[:search], 'title'))
    end
    
    def author_search
        render json: BookSerializer.new(BookFacade.new(params[:search], 'author'))
    end

    def save
        @book = Book.find_by(isbn_13: book_params[:isbn_13])
        if !@book
            @book = Book.create(book_params)
        end

        @saved_book = SavedBook.find_by(user_id: @user.id, book_id: @book.id)
        if !@saved_book
            @saved_book = SavedBook.create(
                user_id: @user.id,
                book_id: @book.id,
                bookshelf: 1
            )
        end
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

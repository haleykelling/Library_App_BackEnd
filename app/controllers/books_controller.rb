class BooksController < ApplicationController
    before_action :authenticate, only: [:save]
    
    def index
        @book_facade = BookFacade.new(params[:search])
        render json: BookSerializer.new(@book_facade)
    end

    def save
        @book = Book.find_by(isbn_13: book_params[:isbn_13])
        if !@book
            @book = Book.create(book_params)
        end
        render json: @book
    end

    def save_to_favorites

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

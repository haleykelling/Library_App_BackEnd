class BooksController < ApplicationController
    def index
        render json: BookSerializer.new(BookFacade.new(params[:search]))
    end

end

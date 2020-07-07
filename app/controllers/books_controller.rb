class BooksController < ApplicationController
    def index
        puts "hit the index"
        render json: BookSerializer.new(BookFacade.new(params[:search]))
    end

end

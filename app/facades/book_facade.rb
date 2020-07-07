class BookFacade 
    attr_reader :id, :search_params, :book_search_20_results

    def initialize(search_params)
        @id = 1
        @search_params = search_params
        @book_search_20_results = top_20
    end

    def new_book_search
        GoogleBooksService.new.book_search(@search_params)
    end

    def top_20
        array = new_book_search["items"].map do |book_data|
            Book.new(book_data["volumeInfo"])
        end
    end
end
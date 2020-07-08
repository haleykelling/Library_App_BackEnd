class BookFacade 
    attr_reader :id, :search_params, :book_search_results

    def initialize(search_params)
        @id = 1
        @search_params = search_params
        @book_search_results = top_20
    end

    def new_book_search
        GoogleBooksService.new.book_search(@search_params)
    end

    def top_20
        @book_array ||= new_book_search["items"].map do |book_data|
            Book.new({
                title: book_data["volumeInfo"]["title"],
                authors: book_data["volumeInfo"]["authors"].join(', '),
                published_date: book_data["volumeInfo"]["publishedDate"],
                description: book_data["volumeInfo"]["description"],
                page_count: book_data["volumeInfo"]["pageCount"],
                categories: combine_categories(book_data["volumeInfo"]["categories"]),
                image_link: book_data["volumeInfo"]["imageLinks"]["thumbnail"],
                isbn_10: get_ISBN(book_data["volumeInfo"])
            })
        end
        @book_array
    end

    def get_ISBN(data)
        data["industryIdentifiers"].each do |identifier|
            if identifier["type"] == "ISBN_10"
                return identifier["identifier"]
            end
        end
    end

    def combine_categories(categories)
        if categories 
            categories.join(', ')
        else
            categories = ''
        end
    end
end
class BookFacade 
    attr_reader :id, :search_params, :book_search_results

    def initialize(search_params, type_of_search)
        @id = 1
        @search_params = search_params
        @type_of_search = type_of_search
        @book_search_results = search_results
    end

    def new_book_search
        GoogleBooksService.new.book_search(@search_params)
    end

    def title_search
        GoogleBooksService.new.title_search(@search_params)
    end

    def author_search
        GoogleBooksService.new.author_search(@search_params)
    end

    def search_results
        if @type_of_search == 'default'
            @book_array ||= new_book_search["items"].map do |book_data|
                new_book_instances(book_data["volumeInfo"])
            end
        elsif @type_of_search == 'title'
            @book_array ||= title_search["items"].map do |book_data|
                new_book_instances(book_data["volumeInfo"])
            end
        elsif @type_of_search == 'author'
            @book_array ||= author_search["items"].map do |book_data|
                new_book_instances(book_data["volumeInfo"])
            end
        end
        @book_array
    end

    def new_book_instances(volume_data)
        Book.new({
            title: volume_data["title"],
            authors: volume_data["authors"].join(', '),
            published_date: volume_data["publishedDate"],
            description: volume_data["description"],
            page_count: volume_data["pageCount"],
            categories: combine_categories(volume_data["categories"]),
            image_link: image_link(volume_data),
            isbn_13: get_ISBN(volume_data)
        })
    end

    def combine_categories(categories)
        if categories 
            categories.join(', ')
        else
            categories = ''
        end
    end

    def image_link(data)
        if data["imageLinks"]
            return data["imageLinks"]["thumbnail"]
        else
            return ''
        end
    end
    
    def get_ISBN(data)
        if data["industryIdentifiers"]
            data["industryIdentifiers"].each do |identifier|
                if identifier["type"] == "ISBN_13"
                    return identifier["identifier"]
                end
            end
        else return '0000000000000'
        end
    end


end
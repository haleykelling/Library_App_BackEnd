class GoogleBooksService
    def book_search(search_params)
        params = URI.encode(search_params)
        response = Excon.get("https://www.googleapis.com/books/v1/volumes?q=#{params}&maxResults=28&langRestrict='en'&printType=books&key=#{ENV['GOOGLE_BOOKS_API_KEY']}", {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }   
        })
        JSON.parse(response.body)
    end

    def title_search(search_params)
        params = URI.encode(search_params)
        response = Excon.get("https://www.googleapis.com/books/v1/volumes?q=intitle:#{params}&maxResults=12&langRestrict='en'&printType=books&key=#{ENV['GOOGLE_BOOKS_API_KEY']}", {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }   
        })
        JSON.parse(response.body)
    end

    def author_search(search_params)
        params = URI.encode(search_params)
        response = Excon.get("https://www.googleapis.com/books/v1/volumes?q=inauthor:#{params}&maxResults=12&langRestrict='en'&printType=books&key=#{ENV['GOOGLE_BOOKS_API_KEY']}", {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }   
        })
        JSON.parse(response.body)
    end
end
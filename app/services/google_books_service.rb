class GoogleBooksService
    def book_search(search_params)
        puts "making api call"
        params = URI.encode(search_params)
        response = Excon.get("https://www.googleapis.com/books/v1/volumes?q=#{params}&maxResults=20&key=#{ENV['GOOGLE_BOOKS_API_KEY']}", {
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }   
        })
        JSON.parse(response.body)
    end
end
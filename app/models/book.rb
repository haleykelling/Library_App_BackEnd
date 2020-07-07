class Book
    def initialize(data)
        @title = data["title"] 
        @authors = data["authors"]
        @published_date = data["publishedDate"]
        @description = data["description"]
        @page_count = data["pageCount"]
        @categories = data["categories"]
        @image_link = data["imageLinks"]["thumbnail"]
        @isbn_10 = get_ISBN(data)
    end
    
    def get_ISBN(data)
        data["industryIdentifiers"].each do |identifier|
            if identifier["type"] == "ISBN_10"
                return identifier["identifier"]
            end
        end
    end
end

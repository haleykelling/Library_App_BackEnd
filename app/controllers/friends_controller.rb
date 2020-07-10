class FriendsController < ApplicationController
    before_action :authenticate, only: [:index]

    def index
        @friendship = Friend.find_by(user_id: @user.id)
        @friend = User.find_by(id: @friendship.friend_id)
        
        @saved_books = SavedBook.where(user_id: @friend.id)
        @organized = organize_by_bookshelf(@saved_books)
        render json: @organized, include: [:book]
        
    end
       
    
    def organize_by_bookshelf(array)
        organized_hash = {
            to_read: [],
            reading: [],
            previously_read: []
        }
        array.each do |saved_book_instance|
            if saved_book_instance.bookshelf == 1
            organized_hash[:to_read] << saved_book_instance
            elsif saved_book_instance.bookshelf == 2
            organized_hash[:reading] << saved_book_instance
            elsif saved_book_instance.bookshelf == 3
            organized_hash[:previously_read] << saved_book_instance
            end
        end
        return organized_hash
    end
        
end

class FriendsController < ApplicationController
    include Bookshelf
    before_action :authenticate, only: [:index]

    def index
        @friendship = Friend.find_by(user_id: @user.id)
        @friend = User.find_by(id: @friendship.friend_id)
        
        @saved_books = SavedBook.where(user_id: @friend.id)
        @organized = organize_by_bookshelf(@saved_books)
        render json: @organized, include: [:book]
        
    end
        
end

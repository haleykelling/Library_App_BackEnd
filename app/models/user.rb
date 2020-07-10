class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true 
    validates :password, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    has_many :saved_books
    has_many :books, through: :saved_books

    has_many :friends
end

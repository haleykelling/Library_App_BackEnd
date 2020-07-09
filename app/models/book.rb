class Book < ApplicationRecord
    has_many :saved_books
    has_many :users, through: :saved_books
end

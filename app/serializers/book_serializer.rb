class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :book_search_results
end

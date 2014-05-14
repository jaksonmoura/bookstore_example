class Author < ActiveRecord::Base
  # has_many :books_authors
  # has_many :books, :through => :books_authors
  has_and_belongs_to_many :books
end

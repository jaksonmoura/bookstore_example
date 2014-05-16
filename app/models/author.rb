class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :id
    indexes :name
  end
end

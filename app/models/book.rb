class Book < ActiveRecord::Base
  # has_many :books_authors
  # has_many :authors, :through => :books_authors
  has_and_belongs_to_many :authors

  accepts_nested_attributes_for :books_authors, allow_destroy: true


  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :id
    indexes :title, analyzer: 'snowball'
    indexes :summary, analyzer: 'snowball'
    indexes :released_at, type: 'date'
    indexes :edition
    indexes :isbn, analyzer: 'keyword'
  end

  def self.search(params)
    tire.search(load: true) do
      query { string params[:query] } if params[:query].present?
    end
  end

end

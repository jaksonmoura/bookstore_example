class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors

  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :id
    indexes :title, analyzer: 'snowball'
    indexes :summary, analyzer: 'snowball'
    indexes :released_at, type: 'date'
    indexes :edition
    indexes :isbn, analyzer: 'keyword'
    indexes :author do
      indexes :id
      indexes :name
    end

  end

  def self.search(params)
    tire.search do
      query { string params[:query] } if params[:query].present?
    end
  end

  # Needed to be searchable
  def to_indexed_json
    to_json include: :authors
  end

end

class Book < ActiveRecord::Base
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

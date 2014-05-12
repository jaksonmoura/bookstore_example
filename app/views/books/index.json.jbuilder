json.array!(@books) do |book|
  json.extract! book, :id, :title, :summary, :released_at, :edition, :isnb, :pages
  json.url book_url(book, format: :json)
end

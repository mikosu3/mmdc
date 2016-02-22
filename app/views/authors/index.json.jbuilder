json.array!(@authors) do |author|
  json.extract! author, :id, :credit_id, :name, :url, :twitter, :pixiv, :email, :lock_version
  json.url author_url(author, format: :json)
end

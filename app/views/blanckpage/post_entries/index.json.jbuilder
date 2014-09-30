json.array!(@post_entries) do |post_entry|
  json.extract! post_entry, :id, :title, :summary, :body, :name, :email, :active
  json.url post_entry_url(post_entry, format: :json)
end

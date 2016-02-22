json.array!(@wanteds) do |wanted|
  json.extract! wanted, :id, :file_name, :folder_name, :extension, :lock_version
  json.url wanted_url(wanted, format: :json)
end

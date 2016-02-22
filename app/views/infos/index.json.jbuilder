json.array!(@infos) do |info|
  json.extract! info, :id, :date, :title, :note, :lock_version
  json.url info_url(info, format: :json)
end

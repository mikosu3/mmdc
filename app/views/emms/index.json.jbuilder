json.array!(@emms) do |emm|
  json.extract! emm, :id, :original_name, :save_file_name, :lock_version, :user_id
  json.url emm_url(emm, format: :json)
end

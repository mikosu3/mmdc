json.array!(@credits) do |credit|
  json.extract! credit, :id, :index, :edit
  json.url credit_url(credit, format: :json)
end

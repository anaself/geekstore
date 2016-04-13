json.array!(@authentifications) do |authentification|
  json.extract! authentification, :id
  json.url authentification_url(authentification, format: :json)
end

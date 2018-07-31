json.extract! trip, :id, :name, :summary, :created_at, :updated_at
json.url trip_url(trip, format: :json)

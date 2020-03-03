json.extract! event, :id, :summary, :dtstart, :dtend, :description, :created_at, :updated_at
json.url event_url(event, format: :json)

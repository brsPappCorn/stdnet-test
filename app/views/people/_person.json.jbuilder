json.extract! person, :id, :occupation, :created_at, :updated_at
json.url person_url(person, format: :json)
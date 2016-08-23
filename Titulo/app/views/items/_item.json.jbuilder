json.extract! item, :id, :Place, :description, :region, :weather, :environment, :activities, :created_at, :updated_at
json.url item_url(item, format: :json)
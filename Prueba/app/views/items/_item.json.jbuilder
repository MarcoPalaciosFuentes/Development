json.extract! item, :id, :region, :name_place, :description, :weather, :environment, :activities, :created_at, :updated_at
json.url item_url(item, format: :json)
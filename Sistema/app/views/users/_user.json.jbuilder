json.extract! user, :id, :admin, :name, :first_name, :laste_name, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
json.extract! user, :id, :admin, :name, :password_digest, :first_name, :last_name, :email, :token_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
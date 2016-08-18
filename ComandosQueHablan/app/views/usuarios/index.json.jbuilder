json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :admin, :nombre_usuario, :primer_nombre, :apellido, :email
  json.url usuario_url(usuario, format: :json)
end

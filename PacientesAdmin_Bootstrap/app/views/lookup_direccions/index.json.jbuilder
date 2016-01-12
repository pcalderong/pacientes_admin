json.array!(@lookup_direccions) do |lookup_direccion|
  json.extract! lookup_direccion, :id, :parent, :value, :descripcion, :type
  json.url lookup_direccion_url(lookup_direccion, format: :json)
end

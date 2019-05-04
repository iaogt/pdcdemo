json.extract! pedido, :id, :cliente, :total, :fecha, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)

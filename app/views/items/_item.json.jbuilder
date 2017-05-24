
json.url item_url(item, format: :json)
json.extract! @item, :id, :name, :description, :picture, :documents, :created_at, :updated_at

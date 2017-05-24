json.array! @items, partial: 'items/item', as: :item
json.extract! @item, :id, :name, :description, :picture, :documents, :created_at, :updated_at

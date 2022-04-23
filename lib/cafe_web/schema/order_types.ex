defmodule CafeWeb.Schema.OrderTypes do
  use Absinthe.Schema.Notation

  input_object :order_product_input do
    field :name, non_null(:string)
    field :price, non_null(:float)
    field :description, :string
    field :orderitem_id, :id
  end

  input_object :product_update_input do
    field :name, :string
    field :price, :float
    field :description, :string
    field :orderitem_id, :id
  end

  object :product do
    field :id, :id
    field :name, :string
    field :price, :float
    field :description, :string
  end

  # order  types
  object :order_item do
    field :id, :id
    field :name, :string
    field :description, :string
    field :product, list_of(:product)
    field :order, list_of(:order)
  end

  object :order do
    field :id, :id
    field :name, :string
    field :description, :string
    field :orderitems, list_of(:order_item)
  end

  input_object :order_item_input do
    field :name, non_null(:string)
    field :product_id, non_null(:id)
  end

  input_object :order_input do
    field :name, non_null(:string)
    field :description, :string
    field :orderitems, list_of(:order_item_input)
  end

  # input_object :order_item_input do
  #   field :name, non_null(:string)
  #   field :description, :string
  # end

  # input_object :order_item_update do
  #   field :name, :string
  #   field :description, :string
  # end
end

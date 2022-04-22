defmodule CafeWeb.Schema.OrderTypes do
  use Absinthe.Schema.Notation

  input_object :order_product_input do
    field :name, non_null(:string)
    field :price, non_null(:float)
    field :description, :string
    field :orderitem_id, :id
  end

  input_object :order_update_input do
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
end

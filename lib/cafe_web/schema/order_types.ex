defmodule CafeWeb.Schema.OrderTypes do
  use Absinthe.Schema.Notation
  alias Cafe.Repo
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

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

  object :order_item do
    field :id, :id

    field :product, list_of(:product) do
      resolve(dataloader(Repo))
    end

    field :order, list_of(:order) do
      resolve(dataloader(Repo))
    end
  end

  object :order do
    field :id, :id
    field :name, :string
    field :description, :string

    field :orderitems, list_of(:order_item) do
      resolve(dataloader(Repo))
    end
  end

  input_object :order_item_input do
    field :product_id, non_null(:id)
    field :order_id, :id
  end

  input_object :order_input do
    field :name, non_null(:string)
    field :description, :string
    field :orderitems, list_of(:order_item_input)
  end

  input_object :item_update do
    field :product_id, :id
    field :order_id, :id
  end

  input_object :order_update do
    field :name, :string
    field :description, :string
  end
end

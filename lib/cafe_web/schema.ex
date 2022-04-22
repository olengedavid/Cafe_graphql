defmodule CafeWeb.Schema do
  use Absinthe.Schema
  alias CafeWeb.Resolvers.Order
  alias Cafe.Orders.Product
  alias Cafe.Repo

  import_types(__MODULE__.OrderTypes)

  query do
    field :products, list_of(:product) do
      resolve(fn _, _, _ ->
        {:ok, Repo.all(Product)}
      end)
    end
  end

  mutation do
    @desc "creat a new product"
    field :create_product, :product do
      arg(:product_input, non_null(:order_product_input))
      resolve(&Order.create_product/3)
    end

    @desc "Delete a product"
    field :delete_product, :product do
        arg(:id, non_null(:id))
        resolve(&Order.delete_product/3)
    end

    @desc "Update product"
    field :update_product, :product do
        arg(:id, non_null(:id))
        arg(:product_input, non_null(:order_update_input))
        resolve(&Order.update_product/3)
    end
  end
end

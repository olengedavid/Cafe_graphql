defmodule CafeWeb.Schema do
  use Absinthe.Schema
  alias CafeWeb.Resolvers.OrderResolver
  alias Cafe.Orders.Product
  alias Cafe.Orders.Order
  alias Cafe.Repo

  import_types(__MODULE__.OrderTypes)

  query do
    field :products, list_of(:product) do
      resolve(fn _, _, _ ->
        {:ok, Repo.all(Product)}
      end)
    end

    field :order, list_of(:order_item) do
      resolve(fn _, _, _ ->
        {:ok, Order |> Repo.all() |> Repo.preload(:orderitems)}
      end)
    end
  end

  mutation do
    @desc "creat a new product"
    field :create_product, :product do
      arg(:product_input, non_null(:order_product_input))
      resolve(&OrderResolver.create_product/3)
    end

    @desc "Delete a product"
    field :delete_product, :product do
      arg(:id, non_null(:id))
      resolve(&OrderResolver.delete_product/3)
    end

    @desc "Update product"
    field :update_product, :product do
      arg(:id, non_null(:id))
      arg(:product_input, non_null(:product_update_input))
      resolve(&OrderResolver.update_product/3)
    end

    @desc "Create order"
    field :create_order, :order do
      arg(:order_input, non_null(:order_input))
      resolve(&OrderResolver.create_order/3)
    end

    # @desc "update an order item"
    # field :update_orderitem, :order_item do
    #   arg(:id, non_null(:id))
    #   arg(:item_update, non_null(:order_item_update))
    #   resolve(&OrderResolver.update_order_item/3)
    # end

    # @desc "delete an order item"
    # field :delete_orderitem, :order_item do
    #   arg(:id, non_null(:id))
    #   resolve(&OrderResolver.delete_order_item/3)
    # end
  end
end

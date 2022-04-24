defmodule CafeWeb.Schema do
  use Absinthe.Schema
  alias CafeWeb.Resolvers.OrderResolver
  alias Cafe.Repo

  import_types(__MODULE__.OrderTypes)

  def context(ctx) do
    source = Dataloader.Ecto.new(Repo)

    loader =
      Dataloader.new()
      |> Dataloader.add_source(Repo, source)

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  query do
    field :propducts, list_of(:product) do
      resolve(&OrderResolver.list_products/2)
    end

    field :order, list_of(:order) do
      resolve(&OrderResolver.list_orders/2)
    end

    field :order_item, list_of(:order_item) do
      resolve(&OrderResolver.list_order_items/2)
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

    @desc "update an order"
    field :update_order, :order do
      arg(:id, non_null(:id))
      arg(:order_update, non_null(:order_update))
      resolve(&OrderResolver.update_order/3)
    end

    @desc "update an order_item"
    field :update_order_item, :order_item do
      arg(:id, non_null(:id))
      arg(:item_update, non_null(:item_update))
      resolve(&OrderResolver.update_order_item/3)
    end

    @desc "delete an order"
    field :delete_order, :order do
      arg(:id, non_null(:id))
      resolve(&OrderResolver.delete_order/3)
    end

    @desc "delete an order item"
    field :delete_orderitem, :order_item do
      arg(:id, non_null(:id))
      resolve(&OrderResolver.delete_order_item/3)
    end
  end
end

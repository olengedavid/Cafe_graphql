defmodule CafeWeb.Resolvers.OrderResolver do
  alias Cafe.Orders

  def create_product(_, %{product_input: attrs}, _) do
    case Orders.create_product(attrs) do
      {:ok, product} ->
        {:ok, product}

      {:error, _message} ->
        {:error, "Sorry could not create a product"}
    end
  end

  def delete_product(_root, %{id: id}, _) do
    product = Orders.get_product(id)

    case Orders.delete_product(product) do
      {:ok, product} ->
        {:ok, product}

      _error ->
        {:error, "sorry could not delete product"}
    end
  end

  def update_product(_root, %{id: id, product_input: attrs}, _info) do
    product = Orders.get_product(id)

    case Orders.update_product(product, attrs) do
      {:ok, product} ->
        {:ok, product}

      _error ->
        {:error, "sorry could not update product"}
    end
  end

  # order items
  def create_order(_root, %{order_input: attrs}, _info) do
    case Orders.create_order(attrs) do
      {:ok, order} ->
        {:ok, order}

      {:error, _message} ->
        {:error, "Sorry could not create the order"}
    end
  end

  def update_order_item(_root, %{id: id, item_update: attrs}, _info) do
    item = Orders.get_item(id)

    case Orders.update_order_item(item, attrs) do
      {:ok, order_item} ->
        {:ok, order_item}

      _error ->
        {:error, "sorry could not update the item"}
    end
  end

  def delete_order_item(_root, %{id: id}, _info) do
    item = Orders.get_item(id)

    case Orders.delete_order_item(item) do
      {:ok, product} ->
        {:ok, product}

      _error ->
        {:error, "sorry could not delete item"}
    end
  end

  #   def list_products(args) do
  #     args
  #     |> Enum.reduce()

  #     Orders.list_products()
  #   end
end

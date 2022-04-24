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

  def update_order(_root, %{id: id, order_update: attrs}, _info) do
    order = Orders.get_order(id)

    case Orders.update_order(order, attrs) do
      {:ok, order} ->
        {:ok, order}

      _error ->
        {:error, "sorry could not update the order"}
    end
  end

  def update_order_item(_root, %{id: id, item_update: attrs}, _info) do
    item = Orders.get_item(id)

    case Orders.update_order_item(item, attrs) do
      {:ok, item} ->
        {:ok, item}

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

  def delete_order(_root, %{id: id}, _) do
    order = Orders.get_order(id)

    case Orders.delete_order(order) do
      {:ok, order} ->
        {:ok, order}

      _error ->
        {:error, "sorry could not delete order"}
    end
  end

  def list_products(_args, _conn) do
    {:ok, Orders.list_products()}
  end

  def list_orders(_args, _conn) do
    {:ok, Orders.list_orders()}
  end

  def list_order_items(_args, _conn) do
    {:ok, Orders.list_order_items()}
  end
end

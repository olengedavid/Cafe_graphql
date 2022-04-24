defmodule Cafe.Orders do
  @moduledoc false

  alias Cafe.Orders.Product
  alias Cafe.Orders.OrderItem
  alias Cafe.Orders.Order
  alias Cafe.Repo

  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  def get_product(id) do
    Repo.get!(Product, id)
  end

  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  def create_order(attrs \\ %{}) do
    IO.inspect(attrs)

    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  def get_order(id) do
    Repo.get!(Order, id)
  end

  def get_item(id) do
    Repo.get!(OrderItem, id)
  end

  def update_order_item(%OrderItem{} = item, attrs) do
    item
    |> OrderItem.changeset(attrs)
    |> Repo.update()
  end

  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  def delete_order_item(%OrderItem{} = item) do
    Repo.delete(item)
  end

  def list_orders do
    Repo.all(Order)
  end

  def list_products do
    Repo.all(Product)
  end

  def list_order_items do
    Repo.all(OrderItem)
  end
end

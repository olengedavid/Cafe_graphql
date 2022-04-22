defmodule Cafe.Orders do
  @moduledoc false

  alias Cafe.Orders.Product
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
end

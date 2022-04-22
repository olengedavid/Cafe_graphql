defmodule CafeWeb.Resolvers.Order do
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
            {:error, "sorry could not delete employee"}
    end
  end

  def update_product(_root, %{id: id, product_input: attrs}, _info) do
    product = Orders.get_product(id)
    case Orders.update_product(product, attrs) do
        {:ok, product} ->
            {:ok, product}
        _error -> 
        {:error, "sorry could not update employee"}
    end
  end

  def list_products(args) do
    args
    |> Enum.reduce()

    Orders.list_products()
  end
end

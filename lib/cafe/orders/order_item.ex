defmodule Cafe.Orders.OrderItem do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  alias Cafe.Orders.Product
  alias Cafe.Orders.Order

  schema "orderitems" do
    belongs_to :product, Product
    belongs_to :order, Order

    timestamps()
  end

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:product_id, :order_id])
    |> validate_required([:product_id])
  end
end

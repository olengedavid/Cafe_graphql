defmodule Cafe.Orders.OrderItem do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  alias Cafe.Orders.Product
  alias Cafe.Orders.Order

  schema "orderitems" do
    field :name, :string
    field :description, :string

    belongs_to :product, Product
    belongs_to :order, Order

    timestamps()
  end

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:name, :description, :product_id, :order_id])
    |> IO.inspect(label: "<<<<<")
    |> validate_required([:name])
  end
end

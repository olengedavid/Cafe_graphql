defmodule Cafe.Orders.Product do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias Cafe.Orders.OrderItem

  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :float

    has_many :orderitems, OrderItem

    timestamps()
  end

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:name, :description, :price])
    |> validate_required([:name, :price])
  end
end

defmodule Cafe.Orders.Product do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias Cafe.Repo
  alias Cafe.Orders.OrderItem

  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :float

    belongs_to :orderitem, OrderItem
  end

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:name, :description, :price])
    |> validate_required([:name, :price])
  end
end

defmodule Cafe.Orders.Order do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  alias Cafe.Orders.OrderItem

  schema "orders" do
    field :name, :string
    field :description, :string

    has_many :orderitems, OrderItem

    timestamps()
  end

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:name, :description])
    |> cast_assoc(:orderitems)
    |> validate_required([:name])
  end
end

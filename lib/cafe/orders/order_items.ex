defmodule Cafe.Orders.OrderItem do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  alias Cafe.Orders.Product

  schema "orderitems" do
    field :name, :string
    field :description, :string

    has_many :products, Product
  end

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:name, :description])
    |> validate_required([:name])
  end
end

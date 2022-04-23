defmodule Cafe.Repo.Migrations.CreateTableProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :price, :float

      timestamps()
    end

    create table(:orders) do
      add :name, :string
      add :description, :string

      timestamps()
    end

    create table(:orderitems) do
      add :name, :string
      add :description, :string
      add :product_id, references(:products), null: false
      add :order_id, references(:orders), null: false

      timestamps()
    end

  end
end

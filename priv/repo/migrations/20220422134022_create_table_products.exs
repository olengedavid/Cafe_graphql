defmodule Cafe.Repo.Migrations.CreateTableProducts do
  use Ecto.Migration

  def change do
    create table(:orderitems) do
      add :name, :string
      add :description, :string
    end

    create table(:products) do
      add :name, :string
      add :description, :string
      add :price, :float
      add :orderitem_id, references(:orderitems)
    end
  end
end

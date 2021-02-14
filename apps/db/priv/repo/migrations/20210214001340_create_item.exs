defmodule DB.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:item) do
      add :title, :string
      add :description, :text
      add :code, :string
      add :type, :integer
      add :completed, :boolean, default: false, null: false
      add :list_id, references(:lists, on_delete: :nothing)

      timestamps()
    end

    create index(:item, [:list_id])
  end
end

defmodule DB.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :title, :string
      add :description, :text
      add :code, :string
      add :type, :integer
      add :completed, :boolean, default: false, null: false

      timestamps()
    end

  end
end

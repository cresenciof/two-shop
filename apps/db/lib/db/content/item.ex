defmodule DB.Content.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item" do
    field :code, :string
    field :completed, :boolean, default: false
    field :description, :string
    field :title, :string
    field :type, :integer
    belongs_to :list, DB.Content.BaseList

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :description, :code, :type, :completed, :list_id])
    |> validate_required([:title, :description, :code, :type, :completed])
  end
end

defmodule DB.Content.BaseList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lists" do
    field :code, :string
    field :completed, :boolean, default: false
    field :description, :string
    field :title, :string
    field :type, :integer
    has_many :items, DB.Content.Item

    timestamps()
  end

  @doc false
  def changeset(base_list, attrs) do
    base_list
    |> cast(attrs, [:title, :description, :code, :type, :completed])
    |> validate_required([:title, :description, :code, :type, :completed])
  end
end

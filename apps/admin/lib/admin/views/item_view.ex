defmodule Admin.ItemView do
  use Admin, :view
  alias Admin.ItemView

  def render("index.json", %{item: item}) do
    %{data: render_many(item, ItemView, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, ItemView, "item.json")}
  end

  def render("item.json", %{item: item}) do
    %{id: item.id,
      title: item.title,
      description: item.description,
      code: item.code,
      type: item.type,
      completed: item.completed}
  end
end

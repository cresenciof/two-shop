defmodule Admin.BaseListView do
  use Admin, :view
  alias Admin.BaseListView

  def render("index.json", %{lists: lists}) do
    %{data: render_many(lists, BaseListView, "base_list.json")}
  end

  def render("show.json", %{base_list: base_list}) do
    %{data: render_one(base_list, BaseListView, "base_list.json")}
  end

  def render("base_list.json", %{base_list: base_list}) do
    %{id: base_list.id,
      title: base_list.title,
      description: base_list.description,
      code: base_list.code,
      type: base_list.type,
      completed: base_list.completed}
  end
end

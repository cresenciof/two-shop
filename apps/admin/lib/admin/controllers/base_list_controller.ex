defmodule Admin.BaseListController do
  use Admin, :controller

  alias DB.Content
  alias DB.Content.BaseList

  action_fallback Admin.FallbackController

  def index(conn, _params) do
    lists = Content.list_lists()
    render(conn, "index.json", lists: lists)
  end

  def create(conn, %{"base_list" => base_list_params}) do
    with {:ok, %BaseList{} = base_list} <- Content.create_base_list(base_list_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.base_list_path(conn, :show, base_list))
      |> render("show.json", base_list: base_list)
    end
  end

  def show(conn, %{"id" => id}) do
    base_list = Content.get_base_list!(id)
    render(conn, "show.json", base_list: base_list)
  end

  def update(conn, %{"id" => id, "base_list" => base_list_params}) do
    base_list = Content.get_base_list!(id)

    with {:ok, %BaseList{} = base_list} <- Content.update_base_list(base_list, base_list_params) do
      render(conn, "show.json", base_list: base_list)
    end
  end

  def delete(conn, %{"id" => id}) do
    base_list = Content.get_base_list!(id)

    with {:ok, %BaseList{}} <- Content.delete_base_list(base_list) do
      send_resp(conn, :no_content, "")
    end
  end
end

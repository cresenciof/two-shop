defmodule Admin.BaseListControllerTest do
  use Admin.ConnCase

  alias DB.Content
  alias DB.Content.BaseList

  @create_attrs %{
    code: "some code",
    completed: true,
    description: "some description",
    title: "some title",
    type: 42
  }
  @update_attrs %{
    code: "some updated code",
    completed: false,
    description: "some updated description",
    title: "some updated title",
    type: 43
  }
  @invalid_attrs %{code: nil, completed: nil, description: nil, title: nil, type: nil}

  def fixture(:base_list) do
    {:ok, base_list} = Content.create_base_list(@create_attrs)
    base_list
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all lists", %{conn: conn} do
      conn = get(conn, Routes.base_list_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create base_list" do
    test "renders base_list when data is valid", %{conn: conn} do
      conn = post(conn, Routes.base_list_path(conn, :create), base_list: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.base_list_path(conn, :show, id))

      assert %{
               "id" => id,
               "code" => "some code",
               "completed" => true,
               "description" => "some description",
               "title" => "some title",
               "type" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.base_list_path(conn, :create), base_list: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update base_list" do
    setup [:create_base_list]

    test "renders base_list when data is valid", %{conn: conn, base_list: %BaseList{id: id} = base_list} do
      conn = put(conn, Routes.base_list_path(conn, :update, base_list), base_list: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.base_list_path(conn, :show, id))

      assert %{
               "id" => id,
               "code" => "some updated code",
               "completed" => false,
               "description" => "some updated description",
               "title" => "some updated title",
               "type" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, base_list: base_list} do
      conn = put(conn, Routes.base_list_path(conn, :update, base_list), base_list: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete base_list" do
    setup [:create_base_list]

    test "deletes chosen base_list", %{conn: conn, base_list: base_list} do
      conn = delete(conn, Routes.base_list_path(conn, :delete, base_list))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.base_list_path(conn, :show, base_list))
      end
    end
  end

  defp create_base_list(_) do
    base_list = fixture(:base_list)
    %{base_list: base_list}
  end
end

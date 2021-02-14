defmodule DB.ContentTest do
  use DB.DataCase

  alias DB.Content

  describe "lists" do
    alias DB.Content.BaseList

    @valid_attrs %{code: "some code", completed: true, description: "some description", title: "some title", type: 42}
    @update_attrs %{code: "some updated code", completed: false, description: "some updated description", title: "some updated title", type: 43}
    @invalid_attrs %{code: nil, completed: nil, description: nil, title: nil, type: nil}

    def base_list_fixture(attrs \\ %{}) do
      {:ok, base_list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_base_list()

      base_list
    end

    test "list_lists/0 returns all lists" do
      base_list = base_list_fixture()
      assert Content.list_lists() == [base_list]
    end

    test "get_base_list!/1 returns the base_list with given id" do
      base_list = base_list_fixture()
      assert Content.get_base_list!(base_list.id) == base_list
    end

    test "create_base_list/1 with valid data creates a base_list" do
      assert {:ok, %BaseList{} = base_list} = Content.create_base_list(@valid_attrs)
      assert base_list.code == "some code"
      assert base_list.completed == true
      assert base_list.description == "some description"
      assert base_list.title == "some title"
      assert base_list.type == 42
    end

    test "create_base_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_base_list(@invalid_attrs)
    end

    test "update_base_list/2 with valid data updates the base_list" do
      base_list = base_list_fixture()
      assert {:ok, %BaseList{} = base_list} = Content.update_base_list(base_list, @update_attrs)
      assert base_list.code == "some updated code"
      assert base_list.completed == false
      assert base_list.description == "some updated description"
      assert base_list.title == "some updated title"
      assert base_list.type == 43
    end

    test "update_base_list/2 with invalid data returns error changeset" do
      base_list = base_list_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_base_list(base_list, @invalid_attrs)
      assert base_list == Content.get_base_list!(base_list.id)
    end

    test "delete_base_list/1 deletes the base_list" do
      base_list = base_list_fixture()
      assert {:ok, %BaseList{}} = Content.delete_base_list(base_list)
      assert_raise Ecto.NoResultsError, fn -> Content.get_base_list!(base_list.id) end
    end

    test "change_base_list/1 returns a base_list changeset" do
      base_list = base_list_fixture()
      assert %Ecto.Changeset{} = Content.change_base_list(base_list)
    end
  end

  describe "item" do
    alias DB.Content.Item

    @valid_attrs %{code: "some code", completed: true, description: "some description", title: "some title", type: 42}
    @update_attrs %{code: "some updated code", completed: false, description: "some updated description", title: "some updated title", type: 43}
    @invalid_attrs %{code: nil, completed: nil, description: nil, title: nil, type: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_item()

      item
    end

    test "list_item/0 returns all item" do
      item = item_fixture()
      assert Content.list_item() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Content.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Content.create_item(@valid_attrs)
      assert item.code == "some code"
      assert item.completed == true
      assert item.description == "some description"
      assert item.title == "some title"
      assert item.type == 42
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Content.update_item(item, @update_attrs)
      assert item.code == "some updated code"
      assert item.completed == false
      assert item.description == "some updated description"
      assert item.title == "some updated title"
      assert item.type == 43
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_item(item, @invalid_attrs)
      assert item == Content.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Content.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Content.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Content.change_item(item)
    end
  end
end

defmodule DB.Content do
  @moduledoc """
  The Content context.
  """

  import Ecto.Query, warn: false
  alias DB.Repo

  alias DB.Content.BaseList

  @doc """
  Returns the list of lists.

  ## Examples

      iex> list_lists()
      [%BaseList{}, ...]

  """
  def list_lists do
    Repo.all(BaseList)
  end

  @doc """
  Gets a single base_list.

  Raises `Ecto.NoResultsError` if the Base list does not exist.

  ## Examples

      iex> get_base_list!(123)
      %BaseList{}

      iex> get_base_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_base_list!(id), do: Repo.get!(BaseList, id)

  @doc """
  Creates a base_list.

  ## Examples

      iex> create_base_list(%{field: value})
      {:ok, %BaseList{}}

      iex> create_base_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_base_list(attrs \\ %{}) do
    %BaseList{}
    |> BaseList.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a base_list.

  ## Examples

      iex> update_base_list(base_list, %{field: new_value})
      {:ok, %BaseList{}}

      iex> update_base_list(base_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_base_list(%BaseList{} = base_list, attrs) do
    base_list
    |> BaseList.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a base_list.

  ## Examples

      iex> delete_base_list(base_list)
      {:ok, %BaseList{}}

      iex> delete_base_list(base_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_base_list(%BaseList{} = base_list) do
    Repo.delete(base_list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking base_list changes.

  ## Examples

      iex> change_base_list(base_list)
      %Ecto.Changeset{data: %BaseList{}}

  """
  def change_base_list(%BaseList{} = base_list, attrs \\ %{}) do
    BaseList.changeset(base_list, attrs)
  end

  alias DB.Content.Item

  @doc """
  Returns the list of item.

  ## Examples

      iex> list_item()
      [%Item{}, ...]

  """
  def list_item do
    Repo.all(Item)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{data: %Item{}}

  """
  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end
end

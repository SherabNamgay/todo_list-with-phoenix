defmodule Todo.Todo_lists do
  @moduledoc """
  The Todo_lists context.
  """

  import Ecto.Query, warn: false
  alias Todo.Repo

  alias Todo.Todo_lists.Todo_list

  @doc """
  Returns the list of todo_list.

  ## Examples

      iex> list_todo_list()
      [%Todo_list{}, ...]

  """
  def list_todo_list do
    Repo.all(Todo_list)
  end

  @doc """
  Gets a single todo_list.

  Raises `Ecto.NoResultsError` if the Todo list does not exist.

  ## Examples

      iex> get_todo_list!(123)
      %Todo_list{}

      iex> get_todo_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo_list!(id), do: Repo.get!(Todo_list, id)

  @doc """
  Creates a todo_list.

  ## Examples

      iex> create_todo_list(%{field: value})
      {:ok, %Todo_list{}}

      iex> create_todo_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo_list(attrs \\ %{}) do
    %Todo_list{}
    |> Todo_list.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a todo_list.

  ## Examples

      iex> update_todo_list(todo_list, %{field: new_value})
      {:ok, %Todo_list{}}

      iex> update_todo_list(todo_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo_list(%Todo_list{} = todo_list, attrs) do
    todo_list
    |> Todo_list.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a todo_list.

  ## Examples

      iex> delete_todo_list(todo_list)
      {:ok, %Todo_list{}}

      iex> delete_todo_list(todo_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todo_list(%Todo_list{} = todo_list) do
    Repo.delete(todo_list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo_list changes.

  ## Examples

      iex> change_todo_list(todo_list)
      %Ecto.Changeset{data: %Todo_list{}}

  """
  def change_todo_list(%Todo_list{} = todo_list, attrs \\ %{}) do
    Todo_list.changeset(todo_list, attrs)
  end
end

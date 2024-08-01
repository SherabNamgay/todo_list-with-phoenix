defmodule Todo.Todo_listsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.Todo_lists` context.
  """

  @doc """
  Generate a todo_list.
  """
  def todo_list_fixture(attrs \\ %{}) do
    {:ok, todo_list} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> Todo.Todo_lists.create_todo_list()

    todo_list
  end
end

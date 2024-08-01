defmodule TodoWeb.Todo_listJSON do
  alias Todo.Todo_lists.Todo_list

  @doc """
  Renders a list of todo_list.
  """
  def index(%{todo_list: todo_list}) do
    %{data: for(todo_list <- todo_list, do: data(todo_list))}
  end

  @doc """
  Renders a single todo_list.
  """
  def show(%{todo_list: todo_list}) do
    %{data: data(todo_list)}
  end

  defp data(%Todo_list{} = todo_list) do
    %{
      id: todo_list.id,
      userId: todo_list.user_id,
      content: todo_list.content,
      isDone: todo_list.is_done
    }
  end
end

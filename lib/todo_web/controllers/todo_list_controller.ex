defmodule TodoWeb.Todo_listController do
  use TodoWeb, :controller

  alias Todo.Todo_lists
  alias Todo.Todo_lists.Todo_list

  action_fallback TodoWeb.FallbackController

  def index(conn, _params) do
    todo_list = Todo_lists.list_todo_list()
    render(conn, :index, todo_list: todo_list)
  end

  def create(conn, %{"todo_list" => todo_list_params}) do
    with {:ok, %Todo_list{} = todo_list} <- Todo_lists.create_todo_list(todo_list_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/todo_list/#{todo_list}")
      |> render(:show, todo_list: todo_list)
    end
  end

  def show(conn, %{"id" => id}) do
    todo_list = Todo_lists.get_todo_list!(id)
    render(conn, :show, todo_list: todo_list)
  end

  def update(conn, %{"id" => id, "todo_list" => todo_list_params}) do
    todo_list = Todo_lists.get_todo_list!(id)

    with {:ok, %Todo_list{} = todo_list} <- Todo_lists.update_todo_list(todo_list, todo_list_params) do
      render(conn, :show, todo_list: todo_list)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo_list = Todo_lists.get_todo_list!(id)

    with {:ok, %Todo_list{}} <- Todo_lists.delete_todo_list(todo_list) do
      send_resp(conn, :no_content, "")
    end
  end
end

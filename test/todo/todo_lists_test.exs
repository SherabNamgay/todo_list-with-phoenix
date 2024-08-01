defmodule Todo.Todo_listsTest do
  use Todo.DataCase

  alias Todo.Todo_lists

  describe "todo_list" do
    alias Todo.Todo_lists.Todo_list

    import Todo.Todo_listsFixtures

    @invalid_attrs %{content: nil}

    test "list_todo_list/0 returns all todo_list" do
      todo_list = todo_list_fixture()
      assert Todo_lists.list_todo_list() == [todo_list]
    end

    test "get_todo_list!/1 returns the todo_list with given id" do
      todo_list = todo_list_fixture()
      assert Todo_lists.get_todo_list!(todo_list.id) == todo_list
    end

    test "create_todo_list/1 with valid data creates a todo_list" do
      valid_attrs = %{content: "some content"}

      assert {:ok, %Todo_list{} = todo_list} = Todo_lists.create_todo_list(valid_attrs)
      assert todo_list.content == "some content"
    end

    test "create_todo_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todo_lists.create_todo_list(@invalid_attrs)
    end

    test "update_todo_list/2 with valid data updates the todo_list" do
      todo_list = todo_list_fixture()
      update_attrs = %{content: "some updated content"}

      assert {:ok, %Todo_list{} = todo_list} = Todo_lists.update_todo_list(todo_list, update_attrs)
      assert todo_list.content == "some updated content"
    end

    test "update_todo_list/2 with invalid data returns error changeset" do
      todo_list = todo_list_fixture()
      assert {:error, %Ecto.Changeset{}} = Todo_lists.update_todo_list(todo_list, @invalid_attrs)
      assert todo_list == Todo_lists.get_todo_list!(todo_list.id)
    end

    test "delete_todo_list/1 deletes the todo_list" do
      todo_list = todo_list_fixture()
      assert {:ok, %Todo_list{}} = Todo_lists.delete_todo_list(todo_list)
      assert_raise Ecto.NoResultsError, fn -> Todo_lists.get_todo_list!(todo_list.id) end
    end

    test "change_todo_list/1 returns a todo_list changeset" do
      todo_list = todo_list_fixture()
      assert %Ecto.Changeset{} = Todo_lists.change_todo_list(todo_list)
    end
  end
end

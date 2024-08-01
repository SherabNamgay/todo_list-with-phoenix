defmodule Todo.Repo.Migrations.AlterTodoListAddIsDone do
  use Ecto.Migration

  def change do
    alter table(:todo_list) do
      add :is_done, :boolean, default: false
    end

  end
end

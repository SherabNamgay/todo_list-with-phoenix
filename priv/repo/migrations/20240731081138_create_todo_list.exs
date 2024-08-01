defmodule Todo.Repo.Migrations.CreateTodoList do
  use Ecto.Migration

  def change do
    create table(:todo_list) do
      add :content, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:todo_list, [:user_id])
  end
end

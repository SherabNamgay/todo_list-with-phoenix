defmodule Todo.Todo_lists.Todo_list do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todo_list" do
    field :content, :string
    field :is_done, :boolean, default: false
    belongs_to :user, Todo.Users.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(todo_list, attrs) do
    todo_list
    |> cast(attrs, [:content, :user_id, :is_done])
    |> validate_required([:content, :user_id, :is_done])
  end
end

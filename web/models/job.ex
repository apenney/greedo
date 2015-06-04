defmodule Greedo.Job do
  use Greedo.Web, :model

  schema "jobs" do
    field :name, :string
    field :repo, :string

    timestamps
  end

  @required_fields ~w(name repo)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_unique(:name, on: Greedo.Repo)
    |> validate_format(:repo, ~r/^git:\/\//)
  end
end

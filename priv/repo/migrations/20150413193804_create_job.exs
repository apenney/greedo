defmodule Greedo.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :name, :string
      add :repo, :string

      timestamps
    end
  end
end

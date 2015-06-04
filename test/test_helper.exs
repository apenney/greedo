defmodule Greedo.Case do
  use ExUnit.CaseTemplate
  alias Ecto.Adapters.SQL
  alias Greedo.Repo

  setup do
    SQL.begin_test_transaction(Repo)

    on_exit fn ->
      SQL.rollback_test_transaction(Repo)
    end
  end

  using do
    quote do
      alias Greedo.Repo
      alias Greedo.Job
      use Plug.Test

      # Remember to change this from `defp` to `def` or it can't be used in your
      # tests.
      def send_request(conn) do
        conn
        |> put_private(:plug_skip_csrf_protection, true)
        |> Greedo.Endpoint.call([])
      end
    end
  end
end

ExUnit.start
#Mix.Tasks.Ecto.Drop.run(["--all", "Greedo.Repo"])
#Mix.Tasks.Ecto.Create.run(["--all", "Greedo.Repo"])
#Mix.Tasks.Ecto.Migrate.run(["--all", "Greedo.Repo"])

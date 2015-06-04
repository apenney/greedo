defmodule Greedo.JobView do
  use Greedo.Web, :view

  def render("index.json", %{jobs: jobs}) do
    jobs
  end

  def render("create.json", %{jobs: jobs}) do
    jobs
  end
end

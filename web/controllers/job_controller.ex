defmodule Greedo.JobController do
  use Greedo.Web, :controller

  alias Greedo.Job

  plug :scrub_params, "job" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    jobs = Repo.all(Job)
    render conn, jobs: jobs
  end

  def new(conn, _params) do
    changeset = Job.changeset(%Job{})
    render conn, changeset: changeset
  end

  def create(conn, %{"job" => job_params}) do
    changeset = Job.changeset(%Job{}, job_params)

    if changeset.valid? do
      Repo.insert(changeset)
      conn |> redirect(to: job_path(conn, :index))
    else
      render conn, changeset: changeset
    end
  end

  def show(conn, %{"id" => id}) do
    job = Repo.get(Job, id)
    render conn, "show.html", job: job
  end

  def edit(conn, %{"id" => id}) do
    job = Repo.get(Job, id)
    changeset = Job.changeset(job)
    render conn, "edit.html", job: job, changeset: changeset
  end

  def update(conn, %{"id" => id, "job" => job_params}) do
    job = Repo.get(Job, id)
    changeset = Job.changeset(job, job_params)

    if changeset.valid? do
      Repo.update(changeset)
      conn |> redirect(to: job_path(conn, :index))
    else
      render conn, "edit.html", job: job, changeset: changeset
    end
  end

  def delete(conn, %{"id" => id}) do
    job = Repo.get(Job, id)
    Repo.delete(job)

    conn |> redirect(to: job_path(conn, :index))
  end
end

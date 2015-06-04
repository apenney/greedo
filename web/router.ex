defmodule Greedo.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Greedo do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api/v1", Greedo do
    pipe_through :api

    resources "/jobs", JobController
  end

  #scope "/jobs", Greedo do
  #  pipe_through :api
  #end

  # Other scopes may use custom stacks.
  # scope "/api", Greedo do
  #   pipe_through :api
  # end
end

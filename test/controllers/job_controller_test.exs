defmodule Greedo.JobControllerTest do
  use Greedo.Case, async: false

  test "/jobs returns a list of configured jobs" do
    jobs_as_json =
      %Job{name: "Test", repo: "github"}
      |> Repo.insert
      |> List.wrap
      |> Poison.encode!

    response = conn(:get, "/api/v1/jobs") |> send_request

    assert response.status == 200
    assert response.resp_body == jobs_as_json
  end

  test "POST to /jobs creates a new job" do
    request = %{job: %{name: "Test", repo: "github"}}

    {:ok, body} = Poison.encode(request, string: true)
    response = 
    conn(:post, "/api/v1/jobs", body)
    |> put_req_header("content-type", "application/json")
    |> send_request

    assert response.status == 302
  end
end

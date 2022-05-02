defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Repo, User}

  def call(params) do
    User.changeset(params)
    |> Repo.insert()
    |> handle_response()
  end

  defp handle_response({:ok, %User{}} = response), do: response

  defp handle_response({:error, errors}) do
    {:error, %{status: :bad_request, errors: errors}}
  end
end

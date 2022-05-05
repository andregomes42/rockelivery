defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Repo, User, Error}

  def call(params) do
    User.changeset(params)
    |> Repo.insert()
    |> handle_response()
  end

  defp handle_response({:ok, %User{}} = response), do: response

  defp handle_response({:error, errors}) do
    Error.build(:bad_request, errors)
  end
end

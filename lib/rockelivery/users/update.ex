defmodule Rockelivery.Users.Update do
  alias Ecto.UUID
  alias Rockelivery.{Repo, User, Error}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> Error.invalid_id_format()
      {:ok, _uuid} -> find(params)
    end
  end

  defp find(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> Error.resource_not_found()
      user -> update(user, params)
    end
  end

  defp update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
    |> handle_response()
  end

  defp handle_response({:ok, %User{}} = response), do: response

  defp handle_response({:error, errors}) do
    Error.build(:bad_request, errors)
  end
end

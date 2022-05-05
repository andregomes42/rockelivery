defmodule Rockelivery.Users.Update do
  alias Rockelivery.{Repo, User, Error}

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> Error.resource_not_found()
      user -> update(user, params)
    end
  end

  defp update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
    |> Error.handle_response()
  end
end

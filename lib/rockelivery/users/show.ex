defmodule Rockelivery.Users.Show do
  alias Ecto.UUID
  alias Rockelivery.{Repo, User, Error}

  def find(id) do
    case UUID.cast(id) do
      :error -> Error.invalid_id_format()
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil -> Error.resource_not_found()
      user -> {:ok, user}
    end
  end
end

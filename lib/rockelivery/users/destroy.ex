defmodule Rockelivery.Users.Destroy do
  alias Ecto.UUID
  alias Rockelivery.{Repo, User, Error}

  def call(id) do
    case UUID.cast(id) do
      :error -> Error.invalid_id_format()
      {:ok, uuid} -> destroy(uuid)
    end
  end

  defp destroy(id) do
    case Repo.get(User, id) do
      nil -> Error.resource_not_found()
      user -> Repo.delete(user)
    end
  end
end

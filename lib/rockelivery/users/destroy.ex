defmodule Rockelivery.Users.Destroy do
  alias Ecto.UUID
  alias Rockelivery.{Repo, User}

  def find(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :not_found, response: "Resource not found"}}
      {:ok, uuid} -> destroy(uuid)
    end
  end

  defp destroy(id) do
    case Repo.get(User, id) do
      nil -> {:error, %{status: :not_found, response: "Resource not found"}}
      user -> Repo.delete(user)
    end
  end
end

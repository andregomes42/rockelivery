defmodule Rockelivery.Users.Show do
  alias Ecto.UUID
  alias Rockelivery.{Repo, User}

  def find(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :not_found, response: "Resource not found"}}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil -> {:error, %{status: :not_found, response: "Resource not found"}}
      user -> {:ok, user}
    end
  end
end
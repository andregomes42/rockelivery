defmodule Rockelivery.Users.Show do
  alias Rockelivery.{Repo, User, Error}

  def call(id) do
    case Repo.get(User, id) do
      nil -> Error.resource_not_found()
      user -> {:ok, user}
    end
  end
end

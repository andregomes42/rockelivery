defmodule Rockelivery.Users.Destroy do
  alias Rockelivery.{Repo, User, Error}

  def call(id) do
    case Repo.get(User, id) do
      nil -> Error.resource_not_found()
      user -> Repo.delete(user)
    end
  end
end

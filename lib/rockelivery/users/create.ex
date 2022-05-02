defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Repo, User}

  def call(params) do
    User.changeset(params)
    |> Repo.insert()
  end
end

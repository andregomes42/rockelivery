defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Repo, User, Error}

  def call(params) do
    User.changeset(params)
    |> Repo.insert()
    |> Error.handle_response()
  end
end

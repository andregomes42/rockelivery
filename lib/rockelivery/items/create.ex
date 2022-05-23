defmodule Rockelivery.Items.Create do
  alias Rockelivery.{Error, Item, Repo}

  def call(params) do
    Item.changeset(params)
    |> Repo.insert()
    |> Error.handle_response()
  end
end

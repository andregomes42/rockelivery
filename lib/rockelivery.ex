defmodule Rockelivery do
  alias Rockelivery.Users
  alias Users.Create, as: UserCreate
  alias Users.Get, as: UserShow

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate show_user(id), to: UserShow, as: :by_id
end

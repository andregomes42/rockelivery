defmodule Rockelivery do
  alias Rockelivery.Users
  alias Users.Create, as: UserCreate
  alias Users.Show, as: UserShow
  alias Users.Destroy, as: UserDestroy

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate find_user(id), to: UserShow, as: :find

  defdelegate destroy_user(id), to: UserDestroy, as: :find
end

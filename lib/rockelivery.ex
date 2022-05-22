defmodule Rockelivery do
  alias Rockelivery.Users
  alias Users.Create, as: UserCreate
  alias Users.Show, as: UserShow
  alias Users.Update, as: UserUpdate
  alias Users.Destroy, as: UserDestroy

  alias Rockelivery.Items
  alias Items.Create, as: ItemCreate

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate find_user(id), to: UserShow, as: :call

  defdelegate update_user(id), to: UserUpdate, as: :call

  defdelegate destroy_user(id), to: UserDestroy, as: :call

  defdelegate create_item(params), to: ItemCreate, as: :call
end

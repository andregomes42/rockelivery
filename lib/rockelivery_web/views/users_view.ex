defmodule RockeliveryWeb.UsersView do
  use RockeliveryWeb, :view

  alias Rockelivery.User

  def render("show.json", %{user: %User{} = user}), do: %{User: user}

  def render("login.json", %{token: token}), do: %{token: token}
end

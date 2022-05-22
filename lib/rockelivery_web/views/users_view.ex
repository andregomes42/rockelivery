defmodule RockeliveryWeb.UsersView do
  use RockeliveryWeb, :view

  alias Rockelivery.User

  def render("show.json", %{user: %User{} = user, token: token}) do
    %{
      User: user,
      token: token
    }
  end
end

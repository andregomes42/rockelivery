defmodule RockeliveryWeb.UsersView do
  use RockeliveryWeb, :view

  alias Rockelivery.User

  def render("show.json", %{user: %User{} = user}) do
    %{
      User: user
    }
  end
end

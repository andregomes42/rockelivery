defmodule RockeliveryWeb.ItemsView do
  use RockeliveryWeb, :view

  alias Rockelivery.Item

  def render("show.json", %{item: %Item{} = item}) do
    %{
      Item: item
    }
  end
end

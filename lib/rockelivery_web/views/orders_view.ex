defmodule RockeliveryWeb.OrdersView do
  use RockeliveryWeb, :view

  alias Rockelivery.Order

  def render("show.json", %{order: %Order{} = order}) do
    %{
      Order: order
    }
  end
end

defmodule RockeliveryWeb.FallbackController do
  use RockeliveryWeb, :controller

  alias RockeliveryWeb.ErrorView

  def call(conn, {:error, errors}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("bad_request.json", errors: errors)
  end
end

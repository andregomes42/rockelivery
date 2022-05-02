defmodule RockeliveryWeb.FallbackController do
  use RockeliveryWeb, :controller

  alias RockeliveryWeb.ErrorView

  def call(conn, {:error, %{status: status, errors: errors}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", errors: errors)
  end
end

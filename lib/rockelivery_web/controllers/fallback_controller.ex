defmodule RockeliveryWeb.FallbackController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Error
  alias RockeliveryWeb.ErrorView

  def call(conn, {:error, %Error{status: status, response: response}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", response: response)
  end
end

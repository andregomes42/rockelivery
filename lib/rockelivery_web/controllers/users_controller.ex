defmodule RockeliveryWeb.UsersController do
  use RockeliveryWeb, :controller

  alias Rockelivery.User
  alias RockeliveryWeb.{Auth.Guardian, FallbackController}

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rockelivery.create_user(params) do
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    end
  end

  def login(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("login.json", token: token)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Rockelivery.find_user(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Rockelivery.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{} = _user} <- Rockelivery.destroy_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end

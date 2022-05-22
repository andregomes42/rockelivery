defmodule RockeliveryWeb.Auth.Guardian do
  use Guardian, otp_app: :rockelivery

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Show

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(%{"sub" => id}), do: Show.call(id)

  def authenticate(%{"id" => id, "password" => password}) do
    with {:ok, %User{password_hash: pass} = user} <- Show.call(id),
         true <- Pbkdf2.verify_pass(password, pass),
         {:ok, token, _claims} <- encode_and_sign(user) do
      {:ok, token}
    else
      false -> Error.build(:unauthorized, "Invalid credentials")
      error -> error
    end
  end

  def authenticate(_), do: Error.build(:bad_request, "Invalid params")
end

defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Repo, User, Error}
  alias Rockelivery.ViaCep.Client

  def call(%{"cep" => cep} = params) do
    changeset = User.changeset(params)

    with {:ok, %User{} = user} <- User.build(changeset),
         {:ok, _cep} <- Client.get_cep_info(cep),
         {:ok, %User{}} = user <- Repo.insert(changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> Error.build(:bad_request, result)
    end
  end
end

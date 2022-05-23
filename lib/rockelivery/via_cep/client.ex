defmodule Rockelivery.ViaCep.Client do
  use Tesla

  alias Rockelivery.Error
  alias Tesla.Env

  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/ws/"

  def get_cep_info(cep) do
    "#{cep}/json/"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 200, body: %{"erro" => "true"}}}),
    do: Error.build(:not_found, "CEP not found")

  defp handle_get({:ok, %Env{status: 200, body: body}}), do: {:ok, body}

  defp handle_get({:ok, %Env{status: 400, body: _body}}),
    do: Error.build(:bad_request, "Invalid CEP")

  defp handle_get({:error, response}), do: Error.build(:bad_request, response)
end

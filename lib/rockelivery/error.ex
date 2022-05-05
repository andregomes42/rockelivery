defmodule Rockelivery.Error do
  alias Rockelivery.User

  @keys [:status, :response]

  @enforce_keys @keys

  defstruct @keys

  def build(staus, response) do
    {
      :error,
      %__MODULE__{
        status: staus,
        response: response
      }
    }
  end

  def resource_not_found(), do: build(:not_found, "Resource not found")

  def handle_response({:ok, %User{}} = response), do: response

  def handle_response({:error, errors}) do
    build(:bad_request, errors)
  end
end

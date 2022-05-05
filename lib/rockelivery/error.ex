defmodule Rockelivery.Error do
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

  def invalid_id_format(), do: build(:bad_request, "Invalid id format")

  def resource_not_found(), do: build(:not_found, "Resource not found")
end

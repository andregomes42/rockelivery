defmodule Rockelivery.Orders.Create do
  import Ecto.Query

  alias Rockelivery.{Error, Item, Order, Repo}
  alias Rockelivery.Orders.ItemsProcessing

  def call(params) do
    params
    |> fetch_items()
    |> handle_items(params)
  end

  defp fetch_items(%{"items" => items_params}) do
    item_ids = Enum.map(items_params, fn item -> item["id"] end)

    query = from item in Item, where: item.id in ^item_ids

    query
    |> Repo.all()
    |> ItemsProcessing.data_processing(item_ids, items_params)
  end

  defp handle_items({:ok, items}, params) do
    params
    |> Order.changeset(items)
    |> Repo.insert()
    |> Error.handle_response()
  end

  defp handle_items({:error, response}, _params), do: Error.build(:bad_request, response)
end

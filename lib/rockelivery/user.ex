defmodule Rockelivery.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset
  alias Rockelivery.Order

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :email, :cpf, :cep, :address, :age, :password]
  @derive {Jason.Encoder, only: [:id, :name, :email, :cpf, :cep, :address, :age]}

  schema "users" do
    field :name, :string
    field :email, :string
    field :cpf, :string
    field :cep, :string
    field :address, :string
    field :age, :integer
    field :password, :string, virtual: true
    field :password_hash, :string

    has_many :orders, Order

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> password_hash()
  end

  def build(changeset), do: apply_action(changeset, :create)

  defp password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp password_hash(changeset), do: changeset
end

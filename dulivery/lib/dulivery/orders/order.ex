defmodule Dulivery.Items.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Enum

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:address, :comments, :payment_method, :user_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "orders" do
    field(:category, Enum, values: [:food, :drink, :desert])
    field(:description, :string)
    field(:price, :decimal)
    field(:photo, :string)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 6)
    |> validate_number(:price, greater_than: 0)
  end
end

defmodule Dulivery.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Enum

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:category, :description, :price, :photo]
  @items_categories [:food, :drink, :desert]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "items" do
    field :category, {:array, Enum}, values: @items_categories
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
    |> validate_number(:cpf, greater_than: 0)
  end
end

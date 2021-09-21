defmodule Coffee do
  @kinds [:arabica, :conilon]
  @types [:grao, :moido, :soluvel]

  @mock_coffee %{
    id: 23,
    brand: "Coffee DUGADO",
    type: :grao,
    kind: :conilon
  }

  def create(%{kind: kind, brand: _brand, type: type})
      when type in @types and kind in @kinds do
    {:ok, %{message: "Coffee created", id: Enum.random(1..100), status: :ok}}
  end

  def create(_params) do
    {:error, %{message: "Invalid params", status: :bad_request}}
  end

  def delete(23) do
    {:ok, %{message: "Coffee deleted", status: :ok, coffee: @mock_coffee}}
  end

  def delete(_id) do
    {:ok, %{message: "Coffee not found", status: :not_found}}
  end

  def get(23) do
    {:ok, %{status: :ok, coffee: @mock_coffee}}
  end

  def get(_id) do
    {:ok, %{message: "Coffee not found", status: :not_found}}
  end
end

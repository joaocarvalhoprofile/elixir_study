defmodule Xirfoods.Orders.OrderTest do
  use ExUnit.Case

  alias Xirfoods.Orders.Order

  import Xirfoods.Factory

  describe "build/2" do
    test "when all params are valid, returns an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "Açai com farinha de tapioca",
          category: :sobremesa,
          unity_price: Decimal.new("15.00"),
          quantity: 2
        )
      ]

      response = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when there is not items in the order, returns an error" do
      user = build(:user)
      items = []

      response = Order.build(user, items)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end

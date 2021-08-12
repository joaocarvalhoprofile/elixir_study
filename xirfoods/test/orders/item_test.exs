defmodule Xirfoods.Orders.ItemTest do
  use ExUnit.Case

  alias Xirfoods.Orders.Item

  import Xirfoods.Factory

  describe "build/4" do
    test "when all params are valid, returns and item" do
      response =
        Item.build(
          "Pizza de Calabresa",
          :pizza,
          "55.00",
          2
        )

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns an error" do
      response =
        Item.build(
          "Pizza de Calabresa",
          :other,
          "55.00",
          1
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, returns an error" do
      response =
        Item.build(
          "Pizza de Calabresa",
          :pizza,
          "zero",
          1
        )

      expected_response = {:error, "Invalid Price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, returns an error" do
      response =
        Item.build(
          "Pizza de Calabresa",
          :pizza,
          "55.00",
          0
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end

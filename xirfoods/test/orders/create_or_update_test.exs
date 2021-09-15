defmodule Xirfoods.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Xirfoods.Factory

  alias Xirfoods.Orders.CreateOrUpdate
  alias Xirfoods.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      cpf = "12345678900"
      user = build(:user, cpf: cpf)

      Xirfoods.start_agents()
      UserAgent.save(user)

      item1 = %{
        category: :pizza,
        description: "Pizza de calabresa",
        quantity: 1,
        unity_price: 35.50
      }

      item2 = %{
        category: :pizza,
        description: "Pizza de peperoni",
        quantity: 1,
        unity_price: 40.50
      }

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid, sves the order", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [item1, item2]}

      response = CreateOrUpdate.call(params)
      assert {:ok, _uuid} = response
    end

    test "when there is no user with given cpf, returns an error", %{
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: "no-cpf", items: [item1, item2]}

      response = CreateOrUpdate.call(params)
      expected_response = {:error, "User not found"}
      assert response == expected_response
    end

    test "when there are invalid items, return an error", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [%{item1 | quantity: 0}, item2]}

      response = CreateOrUpdate.call(params)
      expected_response = {:error, "Invalid items"}
      assert response == expected_response
    end

    test "when there are no items, return an error", %{user_cpf: cpf} do
      params = %{user_cpf: cpf, items: []}

      response = CreateOrUpdate.call(params)
      expected_response = {:error, "Invalid parameters"}
      assert response == expected_response
    end
  end
end

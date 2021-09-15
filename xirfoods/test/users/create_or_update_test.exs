defmodule Xirfoods.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Xirfoods.Users.Agent, as: UserAgent
  alias Xirfoods.Users.CreateOrUpdate
  alias Xirfoods.Users.User

  describe "call/5" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when all params are valid, saves the user" do
      params = %User{
        address: "RUA JOSE TUFAO, 12",
        age: 45,
        cpf: "12345678900",
        email: "joao@gmail.com",
        name: "JOAO CARVALHO"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %User{
        address: "RUA JOSE TUFAO, 12",
        age: 15,
        cpf: "12345678900",
        email: "joao@gmail.com",
        name: "JOAO CARVALHO"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end
  end
end

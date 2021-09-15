defmodule Xirfoods.Users.AgentTest do
  use ExUnit.Case

  alias Xirfoods.Users.Agent, as: UserAgent
  alias Xirfoods.Users.User

  import Xirfoods.Factory

  describe("save/1") do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "Saves the user" do
      user = build(:user)

      assert UserAgent.save(user) == :ok
    end
  end

  describe("get/1") do
    setup do
      UserAgent.start_link(%{})

      cpf = "12345678900"

      {:ok, cpf: cpf}
    end

    test "when the user is found, returns the user", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %User{
           address: "RUA JOSE TUFAO, 12",
           age: 45,
           cpf: "12345678900",
           email: "joao@gmail.com",
           name: "JOAO CARVALHO"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("00000000000")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end

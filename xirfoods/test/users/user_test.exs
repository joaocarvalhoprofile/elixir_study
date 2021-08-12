defmodule Xirfoods.Users.UserTest do
  alias Xirfoods.Users.User
  use ExUnit.Case

  describe "build/5" do
    test "When all params are valid, return the user" do
      response =
        User.build(
          "JOAO CARVALHO",
          "joao@gmail.com",
          "56410085249",
          45,
          "RUA JOSE TUFAO, 12"
        )

      expected_response =
        {:ok,
         %Xirfoods.Users.User{
           address: "RUA JOSE TUFAO, 12",
           age: 45,
           cpf: "56410085249",
           email: "joao@gmail.com",
           name: "JOAO CARVALHO"
         }}

      assert expected_response == response
    end

    test "When Invalid parameters" do
      response =
        User.build(
          "JOAO CARVALHO",
          "joao@gmail.com",
          0,
          0,
          "RUA JOSE TUFAO, 12"
        )

      expected_response = {:error, "Invalid Parameters"}

      assert expected_response == response
    end
  end
end

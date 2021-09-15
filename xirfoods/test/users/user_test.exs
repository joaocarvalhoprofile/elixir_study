defmodule Xirfoods.Users.UserTest do
  use ExUnit.Case

  alias Xirfoods.Users.User

  import Xirfoods.Factory

  describe "build/5" do
    test "When all params are valid, return the user" do
      response =
        User.build(
          "JOAO CARVALHO",
          "joao@gmail.com",
          "12345678900",
          45,
          "RUA JOSE TUFAO, 12"
        )

      expected_response = {:ok, build(:user)}

      assert expected_response == response
    end

    test "When there are invalid params, returns an error" do
      response =
        User.build(
          "JOAO CARVALHO",
          "joao@gmail.com",
          0,
          15,
          "RUA JOSE TUFAO, 12"
        )

      expected_response = {:error, "Invalid Parameters"}

      assert expected_response == response
    end
  end
end

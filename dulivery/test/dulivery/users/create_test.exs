defmodule Dulivery.Users.CreateTest do
  use Dulivery.DataCase, async: true

  import Dulivery.Factory

  alias Dulivery.Exception.Error
  alias Dulivery.Users.Create
  alias Dulivery.Users.User

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 45, email: "john@gmail.com"}} = response
    end

    test "when there ae invalid params, returns an error" do
      params = build(:user_params, %{cep: "123", cpf: "123"})

      response = Create.call(params)

      expected_response = %{cep: ["should be 8 character(s)"], cpf: ["should be 11 character(s)"]}

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end

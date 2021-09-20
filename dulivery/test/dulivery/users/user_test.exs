defmodule Dulivery.Users.UserTest do
  use Dulivery.DataCase, async: true

  alias Ecto.Changeset
  alias Dulivery.Users.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        name: "JOHN DOE",
        email: "john@gmail.com",
        password: "123456",
        cpf: "12345678900",
        age: 45,
        cep: "12345678",
        address: "RUA X"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "JOHN DOE"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        name: "JOHN DOE",
        email: "john@gmail.com",
        password: "123456",
        cpf: "12345678900",
        age: 45,
        cep: "12345678",
        address: "RUA X"
      }

      update_params = %{name: "JOHN THREE", password: "123456"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "JOHN THREE"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        name: "JOHN DOE",
        email: "john@gmail.com",
        password: "123123",
        cpf: "12345678900",
        age: 45,
        cep: "123",
        address: "RUA X"
      }

      response = User.changeset(params)

      expected_response = %{cep: ["should be 8 character(s)"]}

      assert errors_on(response) == expected_response
    end
  end
end

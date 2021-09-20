defmodule Dulivery.Users.UserTest do
  use Dulivery.DataCase, async: true

  import Dulivery.Factory

  alias Dulivery.Users.User
  alias Ecto.Changeset

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "JOHN DOE"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = build(:user_params)

      update_params = %{name: "JOHN THREE", password: "123456"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "JOHN THREE"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:user_params, %{cep: "123", password: "123"})

      response = User.changeset(params)

      expected_response = %{
        cep: ["should be 8 character(s)"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end

defmodule DuliveryWeb.UsersControllerTest do
  use DuliveryWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "name" => "JOHN DOE",
        "email" => "john@gmail.com",
        "password" => "123123",
        "cpf" => "12345678900",
        "age" => 45,
        "cep" => "12345678",
        "address" => "RUA X"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "messge" => "User created",
               "user" => %{
                 "address" => "RUA X",
                 "age" => 45,
                 "cep" => "12345678",
                 "cpf" => "12345678900",
                 "email" => "john@gmail.com",
                 "name" => "JOHN DOE",
                 "id" => _id
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "name" => "JOHN DOE",
        "email" => "john@gmail.com",
        "password" => "123123"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end
end

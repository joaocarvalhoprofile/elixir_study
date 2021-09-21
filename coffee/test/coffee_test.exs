defmodule CoffeeTest do
  use ExUnit.Case

  describe "create/1" do
    test "when there is valid params, returns successfull response" do
      params = %{kind: :arabica, type: :grao, brand: "DUGADO"}

      response = Coffee.create(params)

      assert {:ok, %{id: _id, message: "Coffee created", status: :ok}} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{kind: :arabicaNOT, type: :grao, brand: "DUGADO"}

      response = Coffee.create(params)

      assert {:error, %{message: "Invalid params", status: :bad_request}} = response
    end
  end

  describe "delete/1" do
    test "when the coffee exists, deletes the coffee" do
      id = 23
      response = Coffee.delete(id)

      expected_response =
        {:ok,
         %{
           coffee: %{brand: "Coffee DUGADO", id: 23, kind: :conilon, type: :grao},
           message: "Coffee deleted",
           status: :ok
         }}

      assert response == expected_response
    end

    test "when the coffee not exists, returns an error" do
      id = 0

      response = Coffee.delete(id)

      expected_response = {:ok, %{message: "Coffee not found", status: :not_found}}

      assert response == expected_response
    end
  end

  describe "get/1" do
    test "when the coffee exists, returns the coffee" do
      id = 23
      response = Coffee.get(id)

      expected_response =
        {:ok,
         %{coffee: %{brand: "Coffee DUGADO", id: 23, kind: :conilon, type: :grao}, status: :ok}}

      assert response == expected_response
    end

    test "when the coffee not exists, returns an error" do
      id = 0
      response = Coffee.get(id)

      expected_response = {:ok, %{message: "Coffee not found", status: :not_found}}

      assert response == expected_response
    end
  end
end

defmodule Dulivery.Factory do
  use ExMachina.Ecto, repo: Dulivery.Repo

  alias Dulivery.Users.User

  def user_params_factory do
    %{
      name: "JOHN DOE",
      email: "john@gmail.com",
      password: "123123",
      cpf: "12345678900",
      age: 45,
      cep: "12345678",
      address: "RUA X"
    }
  end

  def user_factory do
    %User{
      id: "eda0abb4-2b23-4dd9-a95e-2d79a1200e25",
      name: "JOHN DOE",
      email: "john@gmail.com",
      password: "123123",
      cpf: "12345678900",
      age: 45,
      cep: "12345678",
      address: "RUA X"
    }
  end
end

defmodule Dulivery.Factory do
  use ExMachina

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
end

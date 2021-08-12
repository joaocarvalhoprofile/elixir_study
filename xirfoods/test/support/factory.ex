defmodule Xirfoods.Factory do
  use ExMachina
  alias Xirfoods.Users.User

  def user_factory do
    %User{
      address: "RUA JOSE TUFAO, 12",
      age: 45,
      cpf: "56410085249",
      email: "joao@gmail.com",
      name: "JOAO CARVALHO"
    }
  end
end

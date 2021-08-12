defmodule Xirfoods.Factory do
  use ExMachina

  alias Xirfoods.Orders.Item
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

  def item_factory do
    %Item{
      description: "Pizza de Calabresa",
      category: :pizza,
      unity_price: Decimal.new("55.00"),
      quantity: 2
    }
  end
end
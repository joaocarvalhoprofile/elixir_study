defmodule Xirfoods.Factory do
  use ExMachina

  alias Xirfoods.Orders.{Item, Order}
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

  def order_factory do
    %Order{
      delivery_address: "RUA JOSE TUFAO, 12",
      items: [
        build(:item),
        build(:item,
          description: "Açai com farinha de tapioca",
          category: :sobremesa,
          unity_price: Decimal.new("15.00"),
          quantity: 2
        )
      ],
      total_price: Decimal.new("140.00"),
      user_cpf: "56410085249"
    }
  end
end

defmodule DuliveryWeb.UsersViewTest do
  use DuliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Dulivery.Factory

  alias DuliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             messge: "User created",
             user: %Dulivery.Users.User{
               address: "RUA X",
               age: 45,
               cep: "12345678",
               cpf: "12345678900",
               email: "john@gmail.com",
               id: "eda0abb4-2b23-4dd9-a95e-2d79a1200e25",
               name: "JOHN DOE"
             }
           } = response
  end
end

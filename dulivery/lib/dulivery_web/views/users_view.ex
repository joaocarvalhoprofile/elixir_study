defmodule DuliveryWeb.UsersView do
  use DuliveryWeb, :view

  alias Dulivery.Users.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      messge: "User created",
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}
end

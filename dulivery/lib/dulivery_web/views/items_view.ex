defmodule DuliveryWeb.ItemsView do
  use DuliveryWeb, :view

  alias Dulivery.Items.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      messge: "Item created",
      item: item
    }
  end

  def render("item.json", %{item: %Item{} = item}), do: %{item: item}
end

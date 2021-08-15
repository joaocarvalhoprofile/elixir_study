defmodule RecursionDataStructure do
  @all_games [
    %{name: "Resident Evil 3", publisher: "Capcom", year: "2020"},
    %{name: "Doom Eternal", publisher: "ID Software", year: "2020"}
  ]
  def all_games, do: @all_games

  def add_game(game) do
    [game | @all_games]
  end
end

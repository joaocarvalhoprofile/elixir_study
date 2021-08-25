defmodule StructureStructs do
  alias StructureStructs.Gamex

  def build_game(title, publisher, release_date) do
    Gamex.build(title, publisher, release_date)
  end
end

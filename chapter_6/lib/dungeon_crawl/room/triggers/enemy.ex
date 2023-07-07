defmodule DungeonCrawl.Room.Triggers.Enemy do
  alias Mix.Shell.IO, as: Shell
  @behaviour DungeonCrawl.Room.Trigger
  def run(character, %{id: :forward}) do
    enemy = Enum.random(DungeonCrawl.Enemies.all())

    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} wants to fight")
    Shell.info("You were prepared and attack first.")
    {updated_player, _enemy} = DungeonCrawl.Battle.fight(character, enemy)
    {updated_player, :forward}
  end
end

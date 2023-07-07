defmodule DungeonCrawl.Character do
  alias DungeonCrawl.Character

  @type t :: %Character{
          name: String.t(),
          description: String.t(),
          hit_points: non_neg_integer(),
          max_hit_points: non_neg_integer(),
          attack_description: String.t(),
          damage_range: Range.t()
        }
  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil

  defimpl String.Chars do
    def to_string(character), do: character.name
  end

  @spec take_damage(Character.t(), number) :: Character.t()
  def take_damage(character, damage) do
    new_hit_points = max(0, character.hit_points - damage)
    %Character{character | hit_points: new_hit_points}
  end

  @spec heal(Character.t(), number) :: Character.t()
  def heal(character, healing_value) do
    new_hit_points = min(character.max_hit_points, character.hit_points + healing_value)
    %Character{character | hit_points: new_hit_points}
  end

  def current_stats(character) do
    "Player stats\nHP: #{character.hit_points}/#{character.max_hit_points}"
  end
end

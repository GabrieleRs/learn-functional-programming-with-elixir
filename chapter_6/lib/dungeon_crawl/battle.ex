defmodule DungeonCrawl.Battle do
  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  def fight(char_a = %{hit_points: hit_points_a}, char_b = %{hit_points: hit_points_b})
      when hit_points_a == 0 or hit_points_b == 0,
      do: {char_a, char_b}

  def fight(char_a, char_b) do
    damaged_char_b = attack(char_a, char_b)
    damaged_char_a = attack(damaged_char_b, char_a)
    fight(damaged_char_a, damaged_char_b)
  end

  defp attack(%{hit_points: hit_points_attacker}, receiver) when hit_points_attacker == 0,
    do: receiver

  defp attack(attacker, receiver) do
    damage = Enum.random(attacker.damage_range)
    damaged_receiver = Character.take_damage(receiver, damage)
    attacker |> attack_message(damage) |> Shell.info()
    receiver |> receive_message(damage) |> Shell.info()
    damaged_receiver
  end

  defp attack_message(character, damage) do
    "#{character.name} attacks with " <>
      "#{character.attack_description} and " <>
      "deals #{damage}."
  end

  defp receive_message(character, damage) do
    "#{character.name} receives #{damage} " <>
      "current HP: #{character.hit_points}"
  end
end

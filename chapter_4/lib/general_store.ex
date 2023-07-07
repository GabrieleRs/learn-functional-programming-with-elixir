defmodule GeneralStore do
  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

  def filter_items([], _) do
    []
  end

  def filter_items([head | rest], magic) when head.magic == magic do
    [head | filter_items(rest, magic)]
  end

  def filter_items([_head | rest], magic) do
    filter_items(rest, magic)
  end
end

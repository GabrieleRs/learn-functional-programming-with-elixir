defmodule EnchanterShop do
  @enchanter_name "Ollivander"
  @enchanter_multiplier 3
  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

  def enchant_for_sale(items) do
    Enum.map(items, fn
      %{magic: false} = item ->
        %{
          item
          | price: item.price * @enchanter_multiplier,
            title: "#{@enchanter_name}'s #{item.title}",
            magic: true
        }

      %{magic: true} = item ->
        item
    end)
  end
end

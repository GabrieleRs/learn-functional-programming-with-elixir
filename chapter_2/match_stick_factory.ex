defmodule MatchStickFactory do
  @big_box_capacity 50
  @medium_box_capacity 20
  @small_box_capacity 5

  def boxes(sticks) do
    get_boxes_and_remaining_sticks = fn capacity, sticks ->
      %{boxes: div(sticks, capacity), sticks: rem(sticks, capacity)}
    end

    bigRes = get_boxes_and_remaining_sticks.(@big_box_capacity, sticks)
    medRes = get_boxes_and_remaining_sticks.(@medium_box_capacity, bigRes[:sticks])
    smallRes = get_boxes_and_remaining_sticks.(@small_box_capacity, medRes[:sticks])

    %{
      big: bigRes[:boxes],
      medium: medRes[:boxes],
      small: smallRes[:boxes],
      remaining: smallRes[:sticks]
    }
  end
end

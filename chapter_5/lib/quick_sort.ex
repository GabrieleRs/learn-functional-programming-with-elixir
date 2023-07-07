defmodule QuickSort do
  def sort([item]) do
    [item]
  end

  def sort([]) do
    []
  end

  def sort([pivot | tail]) do
    {lessThanPivot, moreThanPivot} = Enum.split_with(tail, &(&1 < pivot))
    sort(lessThanPivot) ++ [pivot] ++ sort(moreThanPivot)
  end
end

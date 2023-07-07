defmodule FibRecursive do
  def to(1) do
    [0]
  end

  def to(2) do
    [0, 1]
  end

  def to(n) when n > 0 do
    prev = to(n - 1)
    prev ++ [Enum.at(prev, n - 2) + Enum.at(prev, n - 3)]
  end
end

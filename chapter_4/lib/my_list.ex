defmodule MyList do
  def max([a]) do
    a
  end

  def max([a, b]) do
    cond do
      a > b ->
        a

      a <= b ->
        b
    end
  end

  def max([first, second | rest]) do
    max([max(first, second) | rest])
  end

  def min([a]) do
    a
  end

  def min([a, b]) when a < b do
    a
  end

  def min([_, b]) do
    b
  end

  def min([a, b | rest]) do
    min([min(a, b) | rest])
  end
end

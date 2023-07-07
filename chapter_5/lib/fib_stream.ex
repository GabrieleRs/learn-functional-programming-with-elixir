defmodule FibStream do
  def to(n) do
    generate_fibs()
    |> Enum.take(n)
  end

  def unlimited(fun) do
    generate_fibs()
    |> Stream.map(fn s ->
      Process.sleep(1000)
      s
    end)
    |> Enum.each(fun)
  end

  defp generate_fibs do
    Stream.unfold({0, 1}, fn {prev, next} ->
      {prev, {next, next + prev}}
    end)
  end
end

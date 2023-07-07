defmodule ScrewsFactory do
  def run(pieces) do
    pieces
    |> Stream.map(&add_thread/1)
    |> Stream.map(&add_head/1)
    |> Stream.chunk_every(30)
    |> Stream.flat_map(&pack/1)
    |> Enum.each(&output/1)
  end

  defp add_thread(piece) do
    Process.sleep(50)
    piece <> "--"
  end

  defp add_head(piece) do
    Process.sleep(100)
    "o" <> piece
  end

  defp output(screw) do
    IO.inspect(screw)
  end

  defp pack(screws) when length(screws) <= 30 do
    Process.sleep(70)
    Stream.map(screws, &("|" <> &1 <> "|"))
  end
end

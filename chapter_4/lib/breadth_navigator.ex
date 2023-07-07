defmodule BreadthNavigator do
  def navigate(path, maxBreadth \\ 10) when is_binary(path) do
    drillDir(Path.expand(path), maxBreadth)
  end

  defp drillDir(path, maxBreadth) do
    {:ok, contents} = File.ls(path)
    listContent(path, Enum.sort(contents), maxBreadth, 0)
  end

  defp listContent(_, [], _maxBreadth, _currentBreadth), do: nil

  defp listContent(path, [file | tail], maxBreadth, currentBreadth) do
    filePath = Path.expand(file, path)
    IO.puts(filePath)
    isDir = File.dir?(filePath)

    if isDir do
      listContent(path, tail, maxBreadth, currentBreadth + 1)
    else
      listContent(path, tail, maxBreadth, currentBreadth)
    end

    if isDir && currentBreadth < maxBreadth do
      drillDir(filePath, maxBreadth)
    end
  end
end

defmodule TicTacToe do
  def winner({_, _, _, _, _, _, _, _, _} = grid) do
    outWinner = &{:winner, &1}

    case grid do
      {x, x, x, _, _, _, _, _, _} ->
        outWinner.(x)

      {_, _, _, x, x, x, _, _, _} ->
        outWinner.(x)

      {_, _, _, _, _, _, x, x, x} ->
        outWinner.(x)

      {x, _, _, x, _, _, x, _, _} ->
        outWinner.(x)

      {_, x, _, _, x, _, _, x, _} ->
        outWinner.(x)

      {_, _, x, _, _, x, _, _, x} ->
        outWinner.(x)

      {x, _, _, _, x, _, _, _, x} ->
        outWinner.(x)

      {_, _, x, _, x, _, x, _, _} ->
        outWinner.(x)

      _ ->
        {:no_winner}
    end
  end
end

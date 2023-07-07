defmodule TaxCalculator do
  defstruct tax: 0, net: 0

  def getAppliedTaxAndNet(salary) when is_integer(salary) or is_float(salary) do
    buildRes =
      &%TaxCalculator{
        tax: &2,
        net: &1 - &1 * (&2 / 100)
      }

    cond do
      salary <= 2000 ->
        buildRes.(salary, 0)

      salary <= 3000 ->
        buildRes.(salary, 5)

      salary <= 6000 ->
        buildRes.(salary, 10)

      true ->
        buildRes.(salary, 15)
    end
  end

  def run do
    case Float.parse(IO.gets("Input your salary:\n")) do
      {f, _} ->
        getAppliedTaxAndNet(f)

      _ ->
        IO.puts("Unparsable salary please enter a number")
    end
  end
end

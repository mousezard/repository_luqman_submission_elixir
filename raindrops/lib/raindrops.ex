defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do

  raindrops = fn {numbers,strings} ->
    case {numbers,strings} do
      {numbers,strings} when rem(numbers,3) == 0 -> {div(numbers,3),strings <>"Pling"}
      {numbers,strings} when rem(numbers,5) == 0 -> {div(numbers,5),strings <>"Plang"}
      {numbers,strings} when rem(numbers,7) == 0 -> {div(numbers,7),strings <>"Plong"}
      {numbers,strings} when strings == "" -> {numbers,"#{numbers}"}
      {numbers,strings} -> {numbers,strings}
    end
  end

  {_,res_string } = raindrops.({number,""})
  |>raindrops.()
  |>raindrops.()
  res_string
  end
  end

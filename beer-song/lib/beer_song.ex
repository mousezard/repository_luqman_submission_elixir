defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    # Your implementation here...
    cond do
      number == 2 ->
        "#{number} bottles of beer on the wall, #{number} bottles of beer.\nTake one down and pass it around, #{
          number - 1
        } bottle of beer on the wall.\n"

      number == 1 ->
        "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"

      number == 0 ->
        "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"

      true ->
        "#{number} bottles of beer on the wall, #{number} bottles of beer.\nTake one down and pass it around, #{
          number - 1
        } bottles of beer on the wall.\n"
    end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range\\99..0) do
    lyrics = range
    |> Enum.map(fn x ->
      verse(x) <> "\n"
    end)
    |> Enum.into("")
    String.slice(lyrics,0..(String.length(lyrics)-2))
  end
end

defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do

    map_reduce = sentence
    |> String.replace(~r/[^[:alnum:]-]/u," ")
    |> String.downcase(:default)
    |> String.trim()
    |> String.split(~r/\s+/)
    |> List.flatten()
    |>Enum.group_by(&(&1))

    # return new map of key and counts of value.
    Enum.into(
      Enum.map(
        map_reduce,
        fn ({key,value})-> {key,Enum.count(value)} end),
    %{})
  end
end

defmodule Bob do
  def hey(input) do
    cond do
    # whitespace -> Fine. Be that way!
    String.trim(input) == "" -> "Fine. Be that way!"
    # Question -> Sure.'
    String.contains?(input,"?") and
    String.last(String.trim(input)) == "?" and
    String.bag_distance(String.capitalize(String.downcase(input,:default),:default),input)  > 0.5  -> "Sure."
    # Yell and Question -> Calm down, I know what I'm doing!
    String.upcase(input,:default) == input and
    String.contains?(input,"?") == true and
    String.match?(input,~r/[[:alnum:]]/) == true -> "Calm down, I know what I'm doing!"
    # Yell -> Whoa, chill out!
    String.upcase(input,:default) == input and String.match?(input,~r/[[:alpha:]]/) == true -> "Whoa, chill out!"
    # else -> Whatever.
    true -> "Whatever."
    end
  end
end

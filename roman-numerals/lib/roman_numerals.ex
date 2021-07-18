defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    number2roman = fn x ->
      cond do
        x >= 1000 ->
          {"M", 1000}

        x >= 800 and x < 1000 ->
          subtract = ceil((1000 - x)/ 100)
          {"#{String.duplicate("C", subtract)}M", 1000 - (subtract * 100)}

        x >= 500 ->
          {"D", 500}

        x >= 300 and x < 500 ->
          subtract = ceil((500 - x)/ 100)
          {"#{String.duplicate("C", subtract)}D", 500 - (subtract * 100)}

        x >= 100 ->
          {"C", 100}

        x >= 80 and x < 100 ->
          subtract = ceil((100 - x)/ 10)
          {"#{String.duplicate("X", subtract)}C", 100- (subtract * 10)}

        x >= 50 ->
          {"L", 50}

        x > 30 and x < 50 ->
          subtract = ceil((50 - x)/ 10)
          {"#{String.duplicate("X", subtract)}L", 50 - (subtract * 10)}

        x >= 10 ->
          {"X", 10}

        x > 8 and x < 10 ->
          subtract = 10 - x
          {"#{String.duplicate("I", subtract)}X", 10 - subtract}

        x >= 5 ->
          {"V", 5}

        x > 3 and x < 5 ->
          subtract = div(5,x)
          {"#{String.duplicate("I", subtract)}V", x }

        x >= 1 ->
          {"I", 1}

      end
    end

    res = fn
      string, 0, _ ->
        string

      string, int, var ->
        {str, ints} = number2roman.(int)
        "#{var.(string <> str, int - ints, var)}"
    end

    res.("", number, res)
  end
end

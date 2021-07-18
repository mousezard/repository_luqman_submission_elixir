defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(coins, target) do

    low_filter_pass = fn y,z ->
      Enum.any?(y,fn x -> x <= z end)
    end

    high_filter_pass = fn y,z ->
      Enum.filter(y,fn x -> x <= target - z end)
    end

    diff_finder = fn x,y,z ->
      Enum.reverse(x)
      |>Enum.find(fn a -> a + Enum.sum(y) <= z end)
    end

    value_finder = fn z,p,q ->
      Enum.find(z,fn x -> p == x + q  end)
    end

    value_check = fn z,p,q ->
      Enum.any?(z,fn x -> p == x + q  end)
    end

    replace = fn m,o,z ->
      Enum.map(o, fn x -> if value_check.(m,x,z), do: value_finder.(m,x,z), else: x end)
    end

    # a. total in array
    # b. lack in array
    # c. target
    # d. array in charge
    # e. sum of array

    recursive_map = fn
        a,_b,c,d,e,f when e < c -> [f.(a,c-Enum.sum(d),c,[diff_finder.(a,d,c)|d],Enum.sum(d),f)]
        a,b,c,d,e,f when e > c -> [f.(a,c-Enum.sum(d),c,replace.(a,d,b),Enum.sum(replace.(a,d,b)),f)]
        _a,_b,c,d,e,_f when e==c  -> [d]
  end

  try do
    {:ok,recursive_map.(coins,target,target,[],[],recursive_map)
    |>List.flatten()
    |>Enum.filter( & !is_nil(&1))}
  rescue
    nil -> {:error, "cannot change"}
  end

    #{:error, "cannot change"}
  end
end

defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    use Bitwise

    command = %{
      0b00001 => "wink",
      0b00010 => "double blink",
      0b00100 => "close your eyes",
      0b01000 => "jump"
    }

    reverse = fn y ->
      if (y &&& 0b10000) == 16 do
        y-16
      else
        y
      end
    end

    secret = reverse.(code)

    result = command
    |> Enum.filter(fn {x, y} -> if (secret &&& x) ==  x, do: y  end)
    |> Enum.map(fn x -> elem(x, 1) end)

    if(secret==code,do: result,else: Enum.reverse(result))
    
  end
end

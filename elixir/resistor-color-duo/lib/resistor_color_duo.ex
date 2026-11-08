defmodule ResistorColorDuo do
  @colour_codes %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    {first, _second} = Enum.split(colors, 2)
    Integer.undigits(Enum.map(first, fn x -> @colour_codes[x] end))
  end
end

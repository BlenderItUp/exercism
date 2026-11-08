defmodule ResistorColorTrio do
  @colours_convert [
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
  ]

  @units [
    gigaohms: 1_000_000_000,
    megaohms: 1_000_000,
    kiloohms: 1_000,
    ohms: 1
  ]

  def label([first, second, third | _rest]) do
    main = Integer.undigits([@colours_convert[first], @colours_convert[second]])
    total = main * Integer.pow(10, @colours_convert[third])

    {unit, divisor} =
      Enum.find(@units, {:ohms, 1}, fn {_unit, divisor} ->
        total >= divisor
      end)

    {total / divisor, unit}
  end
end

defmodule BirdCount do
  def today([head | _]), do: head
  def today([]), do: nil

  def increment_day_count([head | tail]), do: [head + 1 | tail]
  def increment_day_count([]), do: [1]

  def has_day_without_birds?([0 | _]), do: true

  def has_day_without_birds?([_ | tail]),
    do: has_day_without_birds?(tail)

  def has_day_without_birds?([]), do: false

  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  def busy_days([]), do: 0

  def busy_days([day | rest]) when day >= 5,
    do: 1 + busy_days(rest)

  def busy_days([_ | rest]),
    do: busy_days(rest)
end

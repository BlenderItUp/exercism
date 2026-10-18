defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({:cup, amount}) do
    {:milliliter, amount * 240}
  end

  def to_milliliter({:fluid_ounce, amount}) do
    {:milliliter, amount * 30}
  end

  def to_milliliter({:teaspoon, amount}) do
    {:milliliter, amount * 5}
  end

  def to_milliliter({:tablespoon, amount}) do
    {:milliliter, amount * 15}
  end

  def to_milliliter({:milliliter, _} = volume_pair) do
    volume_pair
  end

  def from_milliliter({:milliliter, amount}, unit) do
    {:milliliter, factor} = to_milliliter({unit, 1})
    {unit, amount / factor}
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end

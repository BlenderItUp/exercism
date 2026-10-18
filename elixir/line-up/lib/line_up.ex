defmodule LineUp do
  @doc """
  Formats a full ticket sentence for the given name and number, including
  the person's name, the ordinal form of the number, and fixed descriptive text.
  """
  @spec format(name :: String.t(), number :: pos_integer()) :: String.t()
  def format(name, number) do
    ordinal =
      case {rem(number, 100), rem(number, 10)} do
        {teen, _} when teen in 11..13 -> "th"
        {_, 1} -> "st"
        {_, 2} -> "nd"
        {_, 3} -> "rd"
        _ -> "th"
      end

    "#{name}, you are the #{number}#{ordinal} customer we serve today. Thank you!"
  end
end

defmodule Username do
  def sanitize(username) do
    Enum.flat_map(username, fn char ->
      case char do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        ?_ -> [char]
        c when c in ?a..?z -> [char]
        _ -> []
      end
    end)
  end
end

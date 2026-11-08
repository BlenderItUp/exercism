defmodule TakeANumber do
  def start() do
    spawn(fn ->
      server(0)
    end)
  end

  defp server(state) do
    receive do
      {:report_state, value} ->
        send(value, state)
        server(state)

      {:take_a_number, value} ->
        state = state + 1
        send(value, state)
        server(state)

      :stop ->
        exit(self())

      _ ->
        server(state)
    end
  end
end

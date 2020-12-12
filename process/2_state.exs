defmodule ProcessTutorial do
  def start_store() do
    spawn(fn -> receive_message(%{}) end)
  end

  def receive_message(map) do
    receive do
      {:put, key, value} ->
        new_map = Map.put(map, key, value)
        receive_message(new_map)

      {:get, key, pid} ->
        send(pid, Map.get(map, key))
        receive_message(map)
    end
  end
end

pid = ProcessTutorial.start_store()
IO.puts(inspect(pid))

send(pid, {:put, :alma, 1})
send(pid, {:put, :korte, 2})
send(pid, {:put, :banan, 3})

send(pid, {:get, :alma, self()})

receive do
  message -> IO.puts(message)
end

send(pid, {:get, :cseresznye, self()})

receive do
  # to print nil, you need to inspect it, otherwise an empty row will be printed
  message -> IO.puts(inspect(message))
end

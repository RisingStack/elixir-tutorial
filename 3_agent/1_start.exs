{:ok, pid} = Agent.start_link(fn -> %{} end)

Agent.update(pid, fn map -> Map.put(map, :alma, 1) end)
Agent.update(pid, fn map -> Map.put(map, :korte, 2) end)
Agent.update(pid, fn map -> Map.put(map, :banan, 3) end)

Agent.get(pid, fn map -> Map.get(map, :alma) end) |> IO.puts()
Agent.get(pid, fn map -> Map.get(map, :cseresznye) end) |> inspect() |> IO.puts()

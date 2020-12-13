{:ok, _} = Agent.start_link(fn -> %{} end, name: :my_map)

Agent.update(:my_map, fn map -> Map.put(map, :alma, 1) end)
Agent.update(:my_map, fn map -> Map.put(map, :korte, 2) end)
Agent.update(:my_map, fn map -> Map.put(map, :banan, 3) end)

Agent.get(:my_map, fn map -> Map.get(map, :alma) end) |> IO.puts()
Agent.get(:my_map, fn map -> Map.get(map, :cseresznye) end) |> inspect() |> IO.puts()

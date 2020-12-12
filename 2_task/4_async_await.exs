task = Task.async(fn -> "I'm async" end)

IO.puts("I'm doing some other stuff")

Task.await(task) |> IO.puts()

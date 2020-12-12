spawn_link(fn -> raise "oops" end)

IO.puts("I'm fine")

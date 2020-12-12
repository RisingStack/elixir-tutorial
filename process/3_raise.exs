spawn(fn -> raise "oops" end)

IO.puts("I'm fine")

spawn_link(fn -> raise "oops" end)

IO.puts("I'll die now")

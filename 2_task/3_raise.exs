Task.start(fn -> raise "oops" end)

IO.puts("I'm fine")

Task.start_link(fn -> raise "oops" end)

IO.puts("I'm still fine")

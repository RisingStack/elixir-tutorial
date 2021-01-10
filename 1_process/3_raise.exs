spawn(fn -> raise "oops" end)

IO.puts("I'm fine")

spawn_link(fn -> raise "oops" end)

IO.puts("I'll die now")

Process.sleep(1000)

IO.puts("I should not be printed")

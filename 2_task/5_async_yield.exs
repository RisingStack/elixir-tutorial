create_task = fn ->
  # async tasks are always linked!
  Task.async(fn ->
    Process.sleep(100)
    "I'm slow and async"
  end)
end

run_task = fn task, timeout ->
  case Task.yield(task, timeout) || Task.shutdown(task) do
    {:ok, result} ->
      IO.puts(result)

    nil ->
      IO.puts(IO.puts("Failed to get a result in #{timeout}ms"))

      nil
  end
end

task1 = create_task.()
IO.puts("I'm doing some other stuff")
run_task.(task1, 500)

task2 = create_task.()
IO.puts("I'm doing some other stuff")
run_task.(task2, 10)

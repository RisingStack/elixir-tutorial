defmodule ProcessTutorial do
  def start_sender_process(pid, {type, message}) do
    Task.start(fn -> send(pid, {type, message}) end)
  end

  def start_receiver_process do
    Task.start(&receive_message/0)
  end

  defp receive_message do
    receive do
      {:hello, message} -> IO.puts("Hello, world! #{message}")
      {_, message} -> IO.puts(message)
    end

    receive_message()
  end
end

{:ok, pid} = ProcessTutorial.start_receiver_process()

ProcessTutorial.start_sender_process(pid, {:ok, "Started"})

ProcessTutorial.start_sender_process(pid, {:hello, "Look what I can do!"})

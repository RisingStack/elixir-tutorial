defmodule ProcessTutorial do
  def start_sender_process(pid, {type, message}) do
    spawn(fn -> send(pid, {type, message}) end)
  end

  defp receive_message do
    receive do
      {:hello, message} -> IO.puts("Hello, world! #{message}")
      {:error, reason} -> raise reason
      {_, message} -> IO.puts(message)
    end

    receive_message()
  end

  def start_receiver_process do
    spawn_link(&receive_message/0)
  end
end

pid = ProcessTutorial.start_receiver_process()

ProcessTutorial.start_sender_process(pid, {:error, "Oops!"})

ProcessTutorial.start_sender_process(pid, {:ok, "Started"})

ProcessTutorial.start_sender_process(pid, {:hello, "Look what I can do!"})

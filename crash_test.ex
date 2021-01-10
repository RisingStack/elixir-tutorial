defmodule CrashTest.GenServer do
  use GenServer

  @impl true
  def init(_) do
    {:ok, :alive}
  end

  @impl true
  def handle_call({:crash, :sync}, _from, state) do
    raise "oops"

    IO.puts("I'm synchronously dead")

    {:reply, state, state}
  end
  @impl true
  def handle_call({:crash, :spawn}, _from, state) do
    spawn_link(fn -> raise "oops" end)

    IO.puts("I'm killed by my child process")

    {:reply, state, state}
  end

  @impl true
  def handle_call({:crash, :task}, _from, state) do
    Task.start_link(fn -> raise "oops" end)

    IO.puts("I'm fine")

    Process.sleep(1000)

    IO.puts("I should not be printed")

    {:reply, state, state}
  end
end

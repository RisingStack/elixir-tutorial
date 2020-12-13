defmodule GenServer.Tutorial do
  use GenServer

  @impl true
  @spec init(Map) :: {:ok, Map}
  def init(map \\ %{}) do
    {:ok, map}
  end

  @impl true
  @spec handle_call({:get, any()}, pid(), Map) :: {:reply, any(), Map}
  def handle_call({:get, key}, _from, map) do
    {:reply, Map.get(map, key), map}
  end

  @impl true
  @spec handle_call(:get_all, pid(), Map) :: {:reply, Map, Map}
  def handle_call(:get_all, _from, map) do
    {:reply, map, map}
  end

  @impl true
  @spec handle_cast({:put, any(), any()}, Map) :: {:noreply, Map}
  def handle_cast({:put, key, value}, map) do
    {:noreply, Map.put(map, key, value)}
  end

  @impl true
  @spec handle_info(any(), Map) :: {:noreply, Map}
  def handle_info(message, map) do
    IO.puts("Got message: #{inspect(message)}")
    {:noreply, map}
  end
end

{:ok, server} = GenServer.start_link(GenServer.Tutorial, %{"alma" => 1})
GenServer.call(server, :get_all) |> inspect |> IO.puts()

GenServer.cast(server, {:put, :banán, 2}) |> inspect |> IO.puts()
GenServer.cast(server, {:put, :cseresznye, 3}) |> inspect |> IO.puts()

GenServer.call(server, {:get, :cseresznye}) |> inspect |> IO.puts()

send(server, "Hello, world")
send(server, hello: "world", foo: "bar")

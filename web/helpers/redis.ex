require IEx;
defmodule Helpers.Redis do

  use GenServer
  require Logger

  # defstart start_link(_), do: initial_state(0)

  def start_link(otps \\ []) do
    Logger.info "start redis...................."
    GenServer.start_link(__MODULE__, [], otps)
  end

  def init(_) do
    Redix.start_link("redis://localhost:6379/0", name: :redix)
  end

  def handle_call(command, _from, state) do
    result = case command do
      {:get, key} -> Redix.command(state, ["GET","#{key}"])
    end
    {:reply, result, state}
  end

  def handle_cast(command, state) do
    case command do
      {:flush, key} -> 
        Redix.command!(state, ["PUBLISH",:flush, "#{key}"])
        # Redix.pipeline(state,[
        #   ["LREM","vccloud",0, "#{key}"],
        #   ["LREM","trial",0, "#{key}"],
        #   ["LREM","billing",0, "#{key}"],
        #   ["LREM","openstack",0, "#{key}"]])
    end
    {:noreply, state}
  end


  @doc """
    get pid of worker when it started
  """
  @spec get(pid, any) :: pid

  def get(pid, key) do
    GenServer.call(pid, {:get, key}, 1_000_000)
  end

  def flush(pid, key) do
    GenServer.cast(pid, {:flush, key})
  end
end

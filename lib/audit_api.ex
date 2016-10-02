defmodule AuditApi do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      supervisor(AuditApi.Endpoint, []),
      # Start the Ecto repository
      supervisor(AuditApi.Repo, []),
      :poolboy.child_spec(pool(:redis), poolboy_config(Helpers.Redis, :redis, 1), [name: Helpers.Redis])
      # Here you could define other workers and supervisors as children
      # worker(AuditApi.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AuditApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AuditApi.Endpoint.config_change(changed, removed)
    :ok
  end

  def pool(name), do: String.to_atom("pool_#{name}")

  defp poolboy_config(module,name,size) do
    [
      {:name, {:local, pool(name)}},
      {:worker_module, module},
      {:size, size},
      {:max_overflow, 1}
    ]
  end
end

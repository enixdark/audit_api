defmodule AuditApi.Mixfile do
  use Mix.Project

  def project do
    [app: :audit_api,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     preferred_cli_env: [espec: :test],
     aliases: aliases,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {AuditApi, []},
     applications: [:phoenix, :cowboy, :logger, :gettext,
                    :phoenix_ecto, :mongodb_ecto, :redix, :redix_pubsub, :poolboy]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:quantum, ">= 1.7.1"},
     {:phoenix, "~> 1.1.4"},
     {:mongodb_ecto, ">= 0.0.0"},
     {:phoenix_ecto, "~> 2.0"},
     {:phoenix_html, "~> 2.4"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.9"},
     {:cowboy, "~> 1.0"},
     {:tzdata, "== 0.1.8", override: true},
     {:meck, "~> 0.8.4", [only: :test, hex: :meck, optional: false, override: true]},
     # {:mongo, "~> 0.5.4"},
     {:gen_fsm, "~> 0.1.0"},
     {:exrm, "~> 0.18.1"},
     {:json, "~> 0.3.3"},
     {:poison, "~> 2.0"},
     {:httpoison, "~> 0.8.0"},
     {:redix, ">= 0.0.0"},
     {:redix_pubsub, ">= 0.0.0"},
     {:poolboy, "~> 1.5"},
     # {:amnesia, "~> 0.2.4"},
     # {:exactor, "~> 2.2", warn_missing: false},
     # {:espec, "~> 0.8.21", only: :test},
     {:scrivener, "~> 1.0"},
     {:espec_phoenix, "~> 0.2.1", only: :test, app: false},
   ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end
end

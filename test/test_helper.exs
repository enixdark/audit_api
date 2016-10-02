ExUnit.start

Mix.Task.run "ecto.create", ~w(-r AuditApi.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r AuditApi.Repo --quiet)



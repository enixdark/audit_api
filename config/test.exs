use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :audit_api, AuditApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :audit_api, AuditApi.Repo,
  adapter: Mongo.Ecto,
  database: "audit_api_test",
  pool_size: 1

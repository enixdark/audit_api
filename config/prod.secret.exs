use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :audit_api, AuditApi.Endpoint,
  secret_key_base: "nWh4iZER2LAL8SB8oebLFAMQGSfI4mCFtgAmUwSfQ58pO1LijN2gtSF0sgzldP6n"

# Configure your database
config :audit_api, AuditApi.Repo,
  adapter: Mongo.Ecto,
  database: "audit_api_prod",
  pool_size: 20

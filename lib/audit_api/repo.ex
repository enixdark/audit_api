defmodule AuditApi.Repo do
  use Ecto.Repo, otp_app: :audit_api
  use Scrivener, page_size: 10
end


require IEx;
defmodule AuditApi.IndexController do
  use AuditApi.Web, :controller

  def index(conn, params) do
    render conn, metadata: Models.Audit.all(params)
  end

  def flush(conn, %{"email" => email}) do
    render conn, metadata: Models.Audit.flush(email)
  end
end

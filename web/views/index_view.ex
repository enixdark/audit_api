defmodule AuditApi.IndexView do
  use AuditApi.Web, :view

  def render("index.json", %{metadata: data}) do
    data
  end

  def render("flush.json", %{metadata: data}) do
    data
  end

  
end

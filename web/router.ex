defmodule AuditApi.Router do
  use AuditApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AuditApi do
    pipe_through :api
    get "/", IndexController, :index
    get "/:email/flush", IndexController, :flush
  end

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  # scope "/", Audit do
  #   # pipe_through :browser # Use the default browser stack
  #   pipe_through :api
  #   get "/", PageController, :index
  # end
end

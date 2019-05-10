defmodule GraphexWeb.Router do
  use GraphexWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

    # plug Plug.Parsers,
    #   parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    #   pass: ["*/*"],
    #   json_decoder: Jason

    end

  scope "/", GraphexWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  forward "/graphql", Absinthe.Plug, schema: GraphexWeb.GraphqlSchemaStatic

  # Other scopes may use custom stacks.
  scope "/api", GraphexWeb do
    pipe_through :api
      resources "/triggers", TriggersController, except: [:new, :edit]
  end
end

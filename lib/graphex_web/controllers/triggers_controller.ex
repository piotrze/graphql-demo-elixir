defmodule GraphexWeb.TriggersController do
  use GraphexWeb, :controller

  action_fallback GraphexWeb.FallbackController

  def index(conn, params) do
    url = %{ url: params["url"], descripion: "wp portal"}
    Absinthe.Subscription.publish(GraphexWeb.Endpoint, url , links_feed: true)
    render(conn, "index.json")
  end
end

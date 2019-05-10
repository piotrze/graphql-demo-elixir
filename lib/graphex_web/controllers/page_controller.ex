defmodule GraphexWeb.PageController do
  use GraphexWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

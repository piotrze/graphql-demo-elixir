defmodule GraphexWeb.PageControllerTest do
  use GraphexWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Ho ho ho!"
  end
end

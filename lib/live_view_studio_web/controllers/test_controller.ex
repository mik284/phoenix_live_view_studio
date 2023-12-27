defmodule LiveViewStudioWeb.TestController do
  use LiveViewStudioWeb, :controller

  def test(conn, _params) do
    render(conn, :test)
  end
end

defmodule LiveViewStudioWeb.PageController do
  use LiveViewStudioWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def light(conn, _params) do
    render(conn, :LightLive)
  end

  def users(conn, _params) do
    render(conn, :users)
  end
end

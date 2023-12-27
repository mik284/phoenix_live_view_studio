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

    # def users(conn, _params) do
    #   users = [
    #     %{id: 1, name: "Alice", email: "alicemail@gmail.com"},
    #      %{id: 2, name: "mike", email: "mikemail@gmail.com"},
    #   ]
    #   render(conn, :users, users: users)
    # end

    # how to return a json
  def users(conn, _params) do
    users = [
      %{id: 1, name: "Alice", email: "alicemail@gmail.com"},
       %{id: 2, name: "mike", email: "mikemail@gmail.com"},
    ]

    json(conn, %{users: users})
  end

  # redirect route
  def redirectme(conn, _params) do
      # text(conn, "Hello mikey")
      redirect(conn, external: "https://google.com")
      # redirect(conn, to: .page(conn, :users)) TODO: failed confirm with updated version
  end
end

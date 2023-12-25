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
end

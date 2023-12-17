defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  # a live view module ahs three calls back function
  # mount
  def mount(_params,_session, socket) do
    socket = assign(socket, brightness: 10)
    # mount returns a tuple with 2 elements
    {:ok, socket}

    # also the above can be wretten as a oneliner
        # {:ok, assign(socket, brightness: 10)}
  end
  # render
def render(assigns) do
  # ~H creates an Heex template or Html with embedded elixir
  ~H"""
  <h1>  Front Porch Light</h1>
  <div id="light">
    <div class="meter">
      <span style={"width: #{@brightness}%"}>
      <%= @brightness%>%
      </span>

        Off
</button>

<button phx-click="on">
  On
</button>
    </div>
  </div>
  """

end
  # handle_event
end

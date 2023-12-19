defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  # a live view module ahs three calls back function
  # mount
  def mount(_params, _session, socket) do
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
        <button phx-click="off">
          Off
        </button>

      <button phx-click="on">
        On
      </button>
      <button phx-click="down">
          Down
      </button>

      <button phx-click="up">
            Up
      </button>
      </div>
    </div>
    """
  end

  # handle_event
  def handle_event("on", _, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    brightness = socket.assigns.brightness - 10
    socket = assign(socket, :brightness, brightness)
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    brightness = socket.assigns.brightness + 10
    socket = assign(socket, :brightness, brightness)
    {:noreply, socket}
  end
end

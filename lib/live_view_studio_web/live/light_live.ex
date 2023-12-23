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
    <h1>Front Porch Light</h1>

    <div id="light">
      <div class="meter">
        <span style={"width: #{@brightness}%"}>
          <%= @brightness %>%
        </span>
      </div>
      
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

  # def handle_event("down", _, socket) do
  #   brightness = socket.assigns.brightness - 10
  #   socket = assign(socket, :brightness, brightness)
  #   {:noreply, socket}
  # end

  # def handle_event("up", _, socket) do
  #   brightness = socket.assigns.brightness + 10
  #   socket = assign(socket, :brightness, brightness)
  #   {:noreply, socket}
  # end

  # That works, but there’s a convenient shortcut. When updating a value, we can use the update function, like so:

  # def handle_event("down", _, socket) do
  #   socket = update(socket, :brightness, fn b -> b - 10 end)
  #   {:noreply, socket}
  # end

  # def handle_event("up", _, socket) do
  #   socket = update(socket, :brightness, fn b -> b + 10 end)
  #   {:noreply, socket}
  # end
  # You can make this more concise using the Elixir shorthand capture syntax:

  # def handle_event("down", _, socket) do
  #   socket = update(socket, :brightness, &(&1 - 10))
  #   {:noreply, socket}
  # end

  # def handle_event("up", _, socket) do
  #   socket = update(socket, :brightness, &(&1 + 10))
  #   {:noreply, socket}
  # end

  # limit how high or low the light can go by using max and min:

  def handle_event("down", _, socket) do
    socket = update(socket, :brightness, &max(&1 - 10, 0))
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    socket = update(socket, :brightness, &min(&1 + 10, 100))
    {:noreply, socket}
  end
end

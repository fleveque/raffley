defmodule RaffleyWeb.EstimatorLive do
  use RaffleyWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Process.send_after(self(), :tick, 2000)
    end

    socket = assign(socket, tickets: 0, price: 3, page_title: "Raffle Estimator")

    # {:ok, socket, layout: {RaffleyWeb.Layouts, :simple}}
    {:ok, socket}
  end

  # You can also create a file named ./estimator_live.html.heex instead
  # of defining the render function here. This is useful for larger components.
  def render(assigns) do
    ~H"""
    <div class="estimator">
      <h1>Raffle Estimator</h1>

      <section>
        <button phx-click="add" phx-value-quantity="1">
          <span class="icon">➕</span>
          <span>Increase Tickets</span>
        </button>
        <div>
          {@tickets}
        </div>
        @
        <div>
          ${@price}
        </div>
        =
        <div>
          {@tickets * @price}
        </div>
      </section>

      <form phx-submit="set-price">
        <label>Ticket Price:</label>
        <input type="number" name="price" value={@price} min="1" />
      </form>
    </div>
    """
  end

  def handle_event("add", %{"quantity" => quantity}, socket) do
    # tickets = socket.assigns.tickets + 1
    # {:noreply, assign(socket, :tickets, tickets)}

    quantity = String.to_integer(quantity)

    {:noreply, update(socket, :tickets, &(&1 + quantity))}
  end

  def handle_event("set-price", %{"price" => price}, socket) do
    socket = assign(socket, :price, String.to_integer(price))

    {:noreply, socket}
  end

  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, 2000)

    {:noreply, update(socket, :tickets, &(&1 + 10))}
  end
end

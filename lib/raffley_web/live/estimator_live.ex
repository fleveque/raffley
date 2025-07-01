defmodule RaffleyWeb.EstimatorLive do
  use RaffleyWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, tickets: 0, price: 3)
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
    </div>
    """
  end

  def handle_event("add", %{"quantity" => quantity}, socket) do
    # tickets = socket.assigns.tickets + 1
    # {:noreply, assign(socket, :tickets, tickets)}

    quantity = String.to_integer(quantity)
    {:noreply, update(socket, :tickets, &(&1 + quantity))}
  end
end

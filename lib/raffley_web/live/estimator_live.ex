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
end

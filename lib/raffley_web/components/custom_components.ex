defmodule RaffleyWeb.CustomComponents do
  use RaffleyWeb, :html

  attr :status, :atom, values: [:open, :upcoming, :closed], default: :upcoming
  attr :class, :string, default: ""
  # For any global attributes you want to pass (id, phx-click...)
  attr :rest, :global

  def badge(assigns) do
    ~H"""
    <div
      class={[
        "rounded-md px-2 py-1 text-xs font-medium uppercase inline-block border",
        @status == :open && "text-lime-600 border-lime-600",
        @status == :upcoming && "text-amber-600 border-amber-600",
        @status == :closed && "text-gray-600 border-gray-600",
        @class
      ]}
      {@rest}
    >
      {@status}
    </div>
    """
  end

  slot :inner_block, required: true
  slot :details

  def banner(assigns) do
    assigns = assign(assigns, :emoji, ~w(🎉 🎊 🎁 🎈 🥳) |> Enum.random())

    ~H"""
    <div class="banner">
      <h1>
        {render_slot(@inner_block)}
      </h1>
      <div :for={details <- @details} class="details">
        {render_slot(details, @emoji)}
      </div>
    </div>
    """
  end
end

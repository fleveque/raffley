defmodule Raffley.Raffle do
  @moduledoc """
  This module represents a raffle in the Raffley application.
  """

  defstruct [:id, :prize, :ticket_price, :status, :image_path, :description]
end

defmodule Raffley.Raffles do
  @moduledoc """
  This module contains the logic for managing raffles.
  """

  def list_raffles do
    [
      %Raffley.Raffle{
        id: 1,
        prize: "Autographed Jersey",
        ticket_price: 2,
        status: :open,
        image_path: "/images/jersey.jpg",
        description: "Step up, sports fans!"
      },
      %Raffley.Raffle{
        id: 2,
        prize: "Coffee With A Yeti",
        ticket_price: 3,
        status: :upcoming,
        image_path: "/images/yeti-coffee.jpg",
        description: "A super-chill coffee date."
      },
      %Raffley.Raffle{
        id: 3,
        prize: "Vintage Comic Book",
        ticket_price: 1,
        status: :closed,
        image_path: "/images/comic-book.jpg",
        description: "A rare collectible!"
      }
    ]
  end

  def get_raffle(id) when is_integer(id) do
    Enum.find(list_raffles(), fn raffle -> raffle.id == id end)
  end

  def get_raffle(id) when is_binary(id) do
    id
    |> String.to_integer()
    |> get_raffle()
  end
end

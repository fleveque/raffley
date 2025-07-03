defmodule Raffley.Raffles do
  @moduledoc """
  This module contains the logic for managing raffles.
  """

  alias Raffley.Raffles.Raffle
  alias Raffley.Repo

  def list_raffles do
    Repo.all(Raffle)
  end

  def get_raffle!(id) do
    Repo.get!(Raffle, id)
  end

  def featured_raffles(raffle) do
    list_raffles()
    |> List.delete(raffle)
  end
end

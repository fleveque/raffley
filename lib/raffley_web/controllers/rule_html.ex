defmodule RaffleyWeb.RuleHTML do
  @moduledoc """
  This module contains pages rendered by RuleController.

  See the `rule_html` directory for all templates available.
  """
  use RaffleyWeb, :html

  embed_templates "rule_html/*"

  def show(assigns) do
    ~H"""
    <div class="rules">
      <h1>{@greeting}! Don't forget...</h1>
      <p>{@rule.text}</p>
    </div>
    """
  end
end

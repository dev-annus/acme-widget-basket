# frozen_string_literal: true

require 'bigdecimal'
require 'bigdecimal/util'

module Money
  module_function

  def dec(n)
    case n
    when BigDecimal then n
    when String then n.to_d
    else n.to_d
    end
  end

  def round2(n)
    dec(n).round(2, BigDecimal::ROUND_HALF_DOWN)
  end

  # Use Kernel.format explicitly to avoid calling Money.format recursively.
  # This ensures we’re using Ruby’s built-in string formatter, not our own method.
  def format(n)
    Kernel.format('$%.2f', round2(n).to_f)
  end
end

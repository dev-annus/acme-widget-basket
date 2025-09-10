# frozen_string_literal: true

require_relative 'money'

class DeliveryRule
  include Money

  def calculate(subtotal)
    s = Money.dec(subtotal)

    return Money.dec(0) if s >= 90
    return Money.dec(2.95) if s >= 50

    Money.dec(4.95)
  end
end

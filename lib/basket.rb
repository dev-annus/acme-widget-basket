# frozen_string_literal: true

require_relative 'money'

class Basket
  include Money

  def initialize(catalogue:, delivery_rule:, offers: [])
    @catalogue = catalogue
    @delivery_rule = delivery_rule
    @offers = offers
    @items = []
  end

  def add(code)
    product = @catalogue.fetch(code)
    @items << product
  end

  def total
    subtotal = @items.sum { |p| Money.dec(p.price) }
    discount = @offers.sum { |offer| offer.discount(@items) }
    adjusted_total = subtotal - discount
    delivery = @delivery_rule.calculate(adjusted_total)
    Money.round2(adjusted_total + delivery)
  end

  def total_formatted
    Money.format(total)
  end

  # Returns a copy of the basket items.
  # This way, outside code can look at the contents without accidentally changing the basket itself.
  def items
    @items.dup
  end
end

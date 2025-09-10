# frozen_string_literal: true

require_relative '../money'
require_relative 'offer'

# This class is designed with extensibility in mind.
# If future offers are introduced (e.g., for Green or Blue Widgets),
# they can be implemented as separate classes in the same way.

class RedWidgetOffer < Offer
  include Money

  RED_CODE = 'R01'

  def discount(items)
    red_items = items.select { |p| p.code == RED_CODE }
    return Money.dec(0) if red_items.empty?

    price = Money.dec(red_items.first.price)
    pairs = red_items.count / 2
    # do not round here, let Basket handle final rounding
    pairs * (price / 2)
  end
end

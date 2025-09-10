# frozen_string_literal: true

class Offer
  def discount(items)
    raise NotImplementedError, 'implement in subclass'
  end
end

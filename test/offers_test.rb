# frozen_string_literal: true

require_relative 'test_helper'

class OffersTest < Minitest::Test
  def setup
    @offer = RedWidgetOffer.new
    @red = Product.new(code: 'R01', name: 'Red', price: 32.95)
    @blue = Product.new(code: 'B01', name: 'Blue', price: 7.95)
  end

  def test_no_discount_under_two
    assert_in_delta 0.0, @offer.discount([@red]).to_f, 0.001
  end

  def test_half_off_second
    two_reds = [@red, @red]
    assert_in_delta 16.48, @offer.discount(two_reds).to_f, 0.01
  end

  def test_ignores_others
    assert_in_delta 0.0, @offer.discount([@blue, @blue]).to_f, 0.001
  end

  def test_three_reds
    three_reds = [@red, @red, @red]
    assert_in_delta 16.48, @offer.discount(three_reds).to_f, 0.01
  end

  def test_four_reds
    four_reds = [@red, @red, @red, @red]
    assert_in_delta 32.95, @offer.discount(four_reds).to_f, 0.01
  end
end

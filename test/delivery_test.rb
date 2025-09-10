# frozen_string_literal: true

require_relative 'test_helper'

class DeliveryTest < Minitest::Test
  def setup
    @rule = DeliveryRule.new
  end

  def test_under_50
    assert_in_delta 4.95, @rule.calculate(49.99).to_f, 0.001
  end

  def test_between_50_and_90
    assert_in_delta 2.95, @rule.calculate(50).to_f, 0.001
    assert_in_delta 2.95, @rule.calculate(89.99).to_f, 0.001
  end

  def test_free_over_90
    assert_in_delta 0.0, @rule.calculate(90).to_f, 0.001
  end
end

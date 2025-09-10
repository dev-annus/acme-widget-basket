# frozen_string_literal: true

require_relative 'money'

class Catalogue
  include Money

  def initialize(products = [])
    @by_code = {}
    products.each { |p| add(p) }
  end

  def add(product)
    @by_code[product.code] = product
  end

  def fetch(code)
    @by_code.fetch(code) { raise ArgumentError, "Unknown product code: #{code}" }
  end

  def include?(code)
    @by_code.key?(code)
  end
end

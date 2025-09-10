# frozen_string_literal: true

require 'minitest/autorun'
$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))
require 'acme_basket'

def default_catalogue
  Catalogue.new([
                  Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
                  Product.new(code: 'G01', name: 'Green Widget', price: 24.95),
                  Product.new(code: 'B01', name: 'Blue Widget', price: 7.95)
                ])
end

def default_delivery
  DeliveryRule.new
end

def default_offers
  [RedWidgetOffer.new]
end

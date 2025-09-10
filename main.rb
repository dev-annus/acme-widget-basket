#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('lib', __dir__))
require 'acme_basket'

catalogue = Catalogue.new([
                            Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
                            Product.new(code: 'G01', name: 'Green Widget', price: 24.95),
                            Product.new(code: 'B01', name: 'Blue Widget', price: 7.95)
                          ])

delivery_rule = DeliveryRule.new
offers = [RedWidgetOffer.new]

basket = Basket.new(catalogue: catalogue, delivery_rule: delivery_rule, offers: offers)

ARGV.each { |code| basket.add(code) }

puts basket.total_formatted

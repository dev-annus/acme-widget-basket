# Acme Widget Co – Basket

Acme Widget Basket is a proof-of-concept shopping basket system for Acme Widget Co.
It supports product pricing, delivery rules, and special offers like “buy one red widget, get the second half price.

## Features
- Small, focused classes with clear interfaces
- Strategy pattern for delivery and offers
- Dependency injection for rules and product catalogue
- Money operations via `BigDecimal` to avoid float errors
- Minitest unit tests


## Assumptions
- Delivery charges apply **after** offers are applied.
- Multiple offers can be injected.
- Unknown product codes raise an error.

## Repository Structure

```
acme-widget-basket/
├─ README.md
├─ Rakefile
├─ main.rb
├─ lib/
│  ├─ acme_basket.rb
│  ├─ catalogue.rb
│  ├─ product.rb
│  ├─ basket.rb
│  ├─ money.rb
│  ├─ delivery_rule.rb/
│  └─ offers/
│     ├─ offer.rb
│     └─ red_widget_offer.rb
└─ test/
   ├─ test_helper.rb
   ├─ basket_test.rb
   ├─ delivery_test.rb
   └─ offers_test.rb
```

## How It Works

### Catalogue & Products
The basket is initialized with a catalogue of products (`R01`, `G01`, `B01`) including their names and prices.

### Adding Items
Use the `Basket#add` method (or pass product codes via `main.rb`) to add items. Invalid codes are detected and reported.

### Offers & Discounts
Special offers (like “buy one red widget, get the second half price”) are implemented as separate classes extending a base `Offer` class. The basket applies all offers automatically when calculating the total.

### Delivery Rules
Delivery cost is calculated based on the subtotal using a `DeliveryRule`. Orders over $90 are free, orders $50–$89.99 cost $2.95, and orders under $50 cost $4.95.

### Calculating Total
The basket computes the subtotal, subtracts any discounts from offers, adds delivery charges, and rounds to two decimal places for the final total.

### Extensibility
New products, offers, or delivery rules can be added easily without changing the core basket logic each rule lives in its own class, keeping the system modular and maintainable.

## Examples To Run

```
ruby main.rb R01 G01

ruby main.rb R01 R01

ruby main.rb  B01 B01 R01 R01 R01
```

## Run Test cases

```
rake 

or 

rake test
```
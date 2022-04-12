# Jungle

A mini e-commerce application built with Rails 4.2.

Allows users to:
  - register for an account
  - login to their account
  - visit product pages to view product
  - add products to their carts
  - use their carts to checkout their selections and pay for them using their credit cards

Allows admins to:
  - create new product categories
  - create new products, add their details and upload images
  - view some statistics

Screenshots provided at the end

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots
![Jungle Home Page](https://github.com/ahsanirfan85/jungle/blob/master/docs/01-jungle-home-page.png?raw=true)
![Jungle Admin Dashboard](https://github.com/ahsanirfan85/jungle/blob/master/docs/02-jungle-admin-dashboard.png?raw=true)
![Jungle Admin Products Page](https://github.com/ahsanirfan85/jungle/blob/master/docs/03-jungle-admin-products-page.png?raw=true)
![Jungle User Cart](https://github.com/ahsanirfan85/jungle/blob/master/docs/04-jungle-user-cart.png?raw=true)
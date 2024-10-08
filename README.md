# Radius.art Builder

### Tech stack

Ruby on Rails app connecting to a WordPress Multisite instance through the WP REST API.

### Instalation

1. Make sure you have Ruby 3.1.2 installed
2. Run `bundle install`

### Database

1. Edit config/databse.yml and enter your username, password, database, and host to a MySQL database
2. Run `rails db:migrate`

### Credentials

The app uses several external services which require credentials.
You can run `rails credentials:edit` to edit or create a new encrypted credentials file.

Here are the credentials you need:
- AWS - get them from https://aws.amazon.com/
  - access_key_id
  - secret_access_key
- Radius.art WP Multisite credentials - contact hello@radius.art to obtain these
  - wp_username
  - wp_password
  - wu_username
  - wu_password
- Underdog API key - get it from https://app.underdogprotocol.com/
  - underdog_api_key
- Stripe live/test secret/publishable keys - get them from https://dashboard.stripe.com/
  - stripe_live_publishable_key
  - stripe_test_publishable_key
  - stripe_live_secret_key
  - stripe_test_secret_key
- Sendgrid API key - get it from https://app.sendgrid.com/
  - sendgrid_api_key
- Google OAuth 2.0 credentials - get them from https://console.cloud.google.com/
  - google_oauth_client_id
  - google_oauth_client_secret
 
### Running

Run `rails s` and the local server will run on port 3000.

### Deploying to production

There's a `fly.toml` config file for deploying to Fly.io. You will need a Redis machine too.

### Demo

An instance is running at https://builder.radius.art/ and you can check out this demo:

[![Radius.art Builder presentation and demo](https://img.youtube.com/vi/C_EIXCOzSoo/0.jpg)](https://www.youtube.com/watch?v=C_EIXCOzSoo)

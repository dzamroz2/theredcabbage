Rails.configuration.stripe = {
  publishable_key: ENV['PUBLISHABLE_KEY'] || 'pk_test_lL5R3AqfnaHHlfH3vuqJb4UA',
  secret_key: ENV['SECRET_KEY'] || 'sk_test_OkTka8Y8TXdLTfVwb3EG3SxK'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @amount = 500
  end

  def create
    # Amount in cents
    @amount = 500
    user = current_user

    unless user.stripe_customer_id
      customer = Stripe::Customer.create(
        email: user.email,
        source: params[:stripeToken]
      )
      user.update stripe_customer_id: customer.id
    end

    Stripe::Charge.create(
      customer: user.stripe_customer_id,
      amount: @amount,
      description: 'entry fee',
      currency: 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end

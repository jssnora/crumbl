class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success
        @listing = Listing.find(params[:id])
    end

    def webhook
        #creates event to verify post request is from Stripe
        begin
            payload = request.raw_post
            header = request.headers['HTTP_STRIPE_SIGNATURE']
            secret = Rails.application.credentials.dig(:stripe, :webhook_signing_secret)
            event = Stripe::Webhook.construct_event(payload, header, secret)
        #raise exceptions to catch errors from webhook construct event
        rescue Stripe::SignatureVerificationError => e
            render json: {error: "Unauthorised"}, status: 403
            return
        rescue JSON::ParserError => e
            render json: {error: "Bad request"}, status: 422
            return
        end

        payment_intent_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_intent_id)
        listing_id = payment.metadata.listing_id 
        pp payment.charges.data[0].receipt_url
        @listing = Listing.find(listing_id)
        @listing.update(sold: true)
    end
end

class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success
        @order = Order.find_by(listing_id: params[:id])
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
            render json: {error: "Unauthorised Access"}, status: 403
            return
        rescue JSON::ParserError => e
            render json: {error: "Bad Request"}, status: 422
            return
        end
        
        payment_intent_id = event.data.object.payment_intent
        payment = Stripe::PaymentIntent.retrieve(payment_intent_id)
        listing_id = payment.metadata.listing_id 
        buyer_id = payment.metadata.user_id
        receipt = payment.charges.data[0].receipt_url
        @listing = Listing.find(listing_id)
        @listing.update(sold: true)

        #create order infor
        Order.create(listing_id: listing_id, buyer_id: buyer_id, payment_id: payment_intent_id, receipt_url: receipt)
    end
end

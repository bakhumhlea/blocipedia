class ChargesController < ApplicationController
    
    def new
        @user = current_user
        @amount_default = 1500
        ##@status = params[:value]
        
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }",
            description: "Blocipedia Premium",
            amount: @amount_default
        }
    end
    
    def create
        
        @amount_default = 1500
        # Creates a Stripe Customer object, for associating
        # with the charge
        customer = Stripe::Customer.create(
                                            email: params[:stripeEmail],
                                            card: params[:stripeToken]
                                            )
                                            
        # Where the real magic happens
        charge = Stripe::Charge.create(
                                        customer: customer.id, # Note -- this is NOT the user_id in your app
                                        amount: @amount_default,
                                        description: "Blocipedia Premium : #{current_user.email}",
                                        currency: 'usd'
                                        )
        
        flash[:notice] = "Thank you! Your account has been upgraded to premium :) Your are all set #{current_user.username}!."
        current_user.role = "premium"
        current_user.save
        redirect_to edit_user_registration_path # or wherever
        # Stripe will send back CardErrors, with friendly messages
        # when something goes wrong.
        # This `rescue block` catches and displays those errors.
        rescue Stripe::CardError => e
        flash[:alert] = e.message
        redirect_to new_charge_path
    end
    
end

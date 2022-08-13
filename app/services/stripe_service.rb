class StripeService

    def initialize()
        Stripe.api_key="sk_test_51IZXryH8fqa06CtHsimPxKV8p54adv0T3Tc6pDqAMIpsY4oP3urWWlI3cepggVjt3QjWr47vmkOh6w3gy29h4Py800AO9nN08S"#ENV['STRIPE_SECRET_KEY']  
    end

    def find_or_create_customer(customer)
        if customer.customer_stripe_id.present?
            stripe_customer = Stripe::Customer.retrieve(customer.customer_stripe_id)
        else
            stripe_customer = Stripe::Customer.create({
                name:customer.full_name,
                email:customer.email,
                phone:customer.contact_number
            })
            customer.update(customer_stripe_id:stripe_customer.id)
        end
        stripe_customer
    end

    def create_card_token(params)
        Stripe::Token.create({
            card:{
                number:params[:card_number].to_s,
                exp_month:params[:exp_month],
                exp_year:params[:exp_year],
                cvc:params[:cvv]
            }
        })
    end

    def create_stripe_customer_card(params,stripe_customer)
        token =create_card_token(params)
        Stripe::Customer.create_source(
            stripe_customer.id,{
                source:token.id
            }
        )

    end

    def create_stripe_charge(amount_to_be_paid, stripe_customer_id,card_id,workshop)
        Stripe::Charge.create({
            amount:amount_to_be_paid * 100,
            currency:'usd',
            source:card_id,
            customer:stripe_customer_id,
            description:"Amount $#{amount_to_be_paid} charged for #{workshop.name}"
        })

    end

end
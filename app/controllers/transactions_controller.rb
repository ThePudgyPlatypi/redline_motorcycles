class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_cart!

  # uses a gon variable to store the generated client token below
  def new
    gon.client_token = generate_client_token
  end

  def create
    # this stores the information from the user form into the params to pass it on
    unless current_user.has_payment_info?
      @result = Braintree::Transaction.sale(
             amount: current_user.cart_total_price,
             payment_method_nonce: params[:payment_method_nonce],
             customer: { first_name: params[:first_name],
                         last_name: params[:last_name],
                         company: params[:company],
                         email: current_user.email,
                         phone: params[:phone] },
              options: { store_in_vault: true })
    else
      @result = Braintree::Transaction.sale(
               amount: current_user.cart_total_price,
               payment_method_nonce: params[:payment_method_nonce])
    end
    # this is for redirects or re-renders with error or notices
    # also updates the customer details to what was entered in the form above
    if @result.success?
      current_user.update(braintree_customer_id: @result.transaction.customer_details.id) unless current_user.has_payment_info?
      # clears out the cart for the current user if the products have been successfully purchased
      current_user.purchase_cart_products!
      # redirects the transaction details page
      redirect_to root_url, notice: "Congraulations! Your transaction has been successfully!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      # regenerates the client token
      gon.client_token = generate_client_token
      render(:new)
    end
  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])

  end

  private
  # this is a standard generations of the braintree client side client token for authentication on the
  # braintree server
  def generate_client_token
    if current_user.has_payment_info?
      Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
    else
      Braintree::ClientToken.generate
    end
  end

  def check_cart!
    # this will check the cart and throw an error if there is nothing in there.
    # ofcourse the buy button doesn't pop up because of the cart is setup
    if current_user.get_cart_products.blank?
      redirect_to root_url,  alert: "Please add some items to your cart before processing your transaction!"
    end
  end
end

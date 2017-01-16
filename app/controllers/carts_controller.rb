class CartsController < ApplicationController
  # this just restricts access to users before you can add to carts. no guest checkout yet
  before_action :authenticate_user!

  def show
    # grabs the current users cart and then finds all the products that were
    # stored in redis local storage cart for that user
    cart_ids = $redis.smembers current_user_cart
    @cart_products = Product.find(cart_ids)
  end

  def add
    # stores the product id in the users unique cart
    $redis.sadd current_user_cart, params[:product_id]
    # I dont know exactly what this does but it is linking to a method in the user model
    # cart count uses redis scard command to return and integer displaying things in the set
    render json: current_user.cart_count, status: 200
  end

  def remove
    # removes product from current users cart
    $redis.srem current_user_cart, params[:product_id]
    # I dont know exactly what this does but it is linking to a method in the user model
    # cart count uses redis scard command to return and integer displaying things in the set
    render json: current_user.cart_count, status: 200
  end

  private

  # Makes a unique cart name out of the current_user's id
  def current_user_cart
    "cart#{current_user.id}"
  end
end

class User < ApplicationRecord
  has_many :purchases
  has_many :products, through: :purchases
  # uses scard method to get the number of items in the current users cart
  def cart_count
    $redis.scard "cart#{id}"
  end

  # This method gathers the total price of all cart items
  def cart_total_price
    total_price = 0
    # use the method below that gets all ids in user cart
    # loop em and add em to the total
    get_cart_products.each do |product|
      total_price += product.startPrice
    end
    # return total price
    total_price
  end

  # gets all the products in a users cart
  def get_cart_products
    cart_ids = $redis.smembers "cart#{id}"
    Product.find(cart_ids)
  end


  def purchase_cart_products!
    # grabs each purchased item and puts it into a purchased array below
    get_cart_products.each do |product|
      purchase(product)
    end
    # then deletes the cart
    $redis.del "cart#{id}"
  end

  # this is fed the value in purchase_cart_products!
  def purchase(product)
    # stores it in array products unless the item was already purchased, which is checked in
    # the method below
    products << product unless purchase?(product)
  end

  # checks to see if the item is already in the array or not
  # this makes the second part of the the purchase method listed above
  def purchase?(product)
    products.include?(product)
  end

  # returns a true or false depending on whether or not it received an ID back from braintree to show 
  # a returning customer
  def has_payment_info?
    braintree_customer_id
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end

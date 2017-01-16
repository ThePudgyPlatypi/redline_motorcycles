class Product < ApplicationRecord
  belongs_to :subcategory
  has_many :purchases
  has_many :users, through: :purchases
  # This checks inside the current users cart and looks for the products id in the cart
  # if it finds the cart then it will change the text of the button from add to to remove from
  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
end

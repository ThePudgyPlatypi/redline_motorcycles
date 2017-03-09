class Product < ApplicationRecord
  include AlgoliaSearch
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

  algoliasearch do
    # list of attribute used to build an Algolia record
    attribute :title, :description, :manufacturerPartNumber, :brand

    # the `searchableAttributes` (formerly known as attributesToIndex) setting defines the attributes
    # you want to search in: here `title`, `subtitle` & `description`.
    # You need to list them by order of importance. `description` is tagged as
    # `unordered` to avoid taking the position of a match into account in that attribute.
    searchableAttributes ['title', 'manufacturerPartNumber', 'brand', 'description']
  end

end

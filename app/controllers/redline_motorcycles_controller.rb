class RedlineMotorcyclesController < ApplicationController
  def index
    @products = Product.all
    @newestProducts = Product.all.order(created_at: :desc).limit(4)
    @category = Category.all
  end

  def repair
  end

  def kymco
  end
end

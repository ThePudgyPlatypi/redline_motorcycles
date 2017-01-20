module ApplicationHelper
  def category
    @category = Category.all
  end
end

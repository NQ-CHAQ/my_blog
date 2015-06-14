module ApplicationHelper
  def find_category_title(category_id)
    category = Category.find( category_id )
    category.title
  end
end

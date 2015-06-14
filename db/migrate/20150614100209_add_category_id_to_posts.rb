class AddCategoryIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category_id, :integer , null: false, default: 1
  end
end

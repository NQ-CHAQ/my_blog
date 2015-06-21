class AddNameAndDescriptionAndImageUrlToWritters < ActiveRecord::Migration
  def change
    add_column :writters, :name, :string
    add_column :writters, :description, :string
    add_column :writters, :image_url, :string
  end
end

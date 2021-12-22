class AddCategory2 < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :category2, :string
  end
end

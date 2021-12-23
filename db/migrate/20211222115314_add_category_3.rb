class AddCategory3 < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :category3, :string
  end
end

class RemoveCategory2FromResources < ActiveRecord::Migration[6.0]
  def change
    remove_column :resources, :category2, :string
  end
end

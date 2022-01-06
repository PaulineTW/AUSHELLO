class RemoveCategory3FromResources < ActiveRecord::Migration[6.0]
  def change
    remove_column :resources, :category3, :string
  end
end

class RemoveCategory1FromResources < ActiveRecord::Migration[6.0]
  def change
    remove_column :resources, :category1, :string
  end
end

class AddFullAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :full_address, :string
  end
end

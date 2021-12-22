class RenameCategorytoCategory1 < ActiveRecord::Migration[6.0]
  def change
    rename_column :resources, :category, :category1
  end
end

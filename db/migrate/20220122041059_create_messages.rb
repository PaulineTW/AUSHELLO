class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.boolean :solved, default: false
      t.references :user, null: false, foreign_key: true
      t.references :resource, null: false, foreign_key: true

      t.timestamps
    end
  end
end

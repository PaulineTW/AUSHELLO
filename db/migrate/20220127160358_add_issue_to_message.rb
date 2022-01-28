class AddIssueToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :issue, :string
  end
end

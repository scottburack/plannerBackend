class EditCreatorInGroupsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :groups, :creator_id
    add_column :groups, :creator_username, :string
  end
end

class EditGroupsUsernameRow < ActiveRecord::Migration[5.1]
  def change
    remove_column :groups, :creator_username
    add_column :groups, :user_id, :integer
  end
end

class AddCreatorIdToGroupsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :creator_id, :integer
  end
end

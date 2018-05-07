class AddGroupIdToChatMessagesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :chat_messages, :group_id, :integer
  end
end

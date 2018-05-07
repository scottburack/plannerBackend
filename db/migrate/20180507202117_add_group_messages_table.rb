class AddGroupMessagesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :group_messages do |t|
      t.text :content
      t.integer :group_id
      t.string :sender_username
      t.timestamps
    end
  end
end

class AddJournalEntryRoWToEventTable < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :journal_entry, :text
  end
end

class ChangeEventTimeToDatetime < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :time_start
    add_column :events, :time_start, :datetime

    remove_column :events, :time_end
    add_column :events, :time_end, :datetime
  end
end

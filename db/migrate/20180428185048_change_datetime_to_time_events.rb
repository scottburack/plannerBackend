class ChangeDatetimeToTimeEvents < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :time_start, :time
    change_column :events, :time_end, :time

  end
end

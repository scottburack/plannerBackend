class ChangeBackTimeColumnsInEvents < ActiveRecord::Migration[5.1]
  def change

    remove_column :events, :time_start
    add_column :events, :time_start, :time

    remove_column :events, :time_end
    add_column :events, :time_end, :time

  end
end

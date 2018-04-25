class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :group_id
      t.string :name
      t.date :date_start
      t.date :date_end
      t.datetime :time_start
      t.datetime :time_end
      t.integer :votes
      t.string :img_url
      t.string :event_url
      t.timestamps
    end
  end
end

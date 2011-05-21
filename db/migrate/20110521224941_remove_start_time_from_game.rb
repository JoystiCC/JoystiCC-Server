class RemoveStartTimeFromGame < ActiveRecord::Migration
  def self.up
    remove_column :games, :start_time
  end
 
  def self.down
    add_column :games, :start_time, :integer
  end
end

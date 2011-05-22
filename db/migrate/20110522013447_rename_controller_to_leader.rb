class RenameControllerToLeader < ActiveRecord::Migration
  def self.up
    remove_column :teams, :controller_id
    add_column :teams, :leader_id, :integer
  end
 
  def self.down
    add_column :teams, :controller_id, :integer
    remove_column :teams, :leader_id
  end
end

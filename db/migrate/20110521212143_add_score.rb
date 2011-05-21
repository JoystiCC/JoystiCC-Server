class AddScore < ActiveRecord::Migration
  def self.up
    create_table :player_scores, :id => false do |t|
      t.integer :player_id
      t.integer :team_id
      t.integer :points
    end
  end
 
  def self.down
    drop_table :player_scores
  end
end

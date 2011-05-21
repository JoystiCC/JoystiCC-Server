class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name
      t.integer :owner_id
      t.integer :start_time
      t.integer :end_time
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end

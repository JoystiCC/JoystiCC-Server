class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name
      t.int :owner_id
      t.int :start_time
      t.int :end_time
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end

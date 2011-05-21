class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :username
      t.string :email
      t.string :password
      t.integer :team_id
      t.integer :direction

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end

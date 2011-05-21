class AddKeytoPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :access_key, :string
  end
 
  def self.down
    remove_column :players, :access_key
  end
end

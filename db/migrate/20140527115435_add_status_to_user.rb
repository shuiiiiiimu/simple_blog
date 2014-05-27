class AddStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :state, :integer, :default => 1, :null => false
  end
end

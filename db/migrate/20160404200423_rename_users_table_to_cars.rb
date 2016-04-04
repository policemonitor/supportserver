class RenameUsersTableToCars < ActiveRecord::Migration
  def change
    rename_table :users, :cars
  end
end

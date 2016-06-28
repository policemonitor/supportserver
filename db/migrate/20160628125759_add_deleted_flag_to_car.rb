class AddDeletedFlagToCar < ActiveRecord::Migration
  def change
    add_column :cars, :deleted, :boolean, default: false
  end
end

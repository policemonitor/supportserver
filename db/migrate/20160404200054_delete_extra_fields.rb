class DeleteExtraFields < ActiveRecord::Migration
  def change
    remove_column :users, :address
    remove_column :users, :description
  end
end

class PrepareToSynchr < ActiveRecord::Migration
  def change
    remove_column :cars, :title
    add_column :cars, :car_number, :string
    add_column :cars, :vin_number, :string
    add_column :cars, :car_name, :string
  end
end

class AddStatusAndRepair < ActiveRecord::Migration
  def change
    add_column :cars, :on_duty, :boolean, default: true
    add_column :cars, :on_a_mission, :boolean, default: false 
  end
end

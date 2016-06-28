class RenameCrewNameInCarName < ActiveRecord::Migration
  def change
    rename_column :cars, :crew_name, :car_name
  end
end

class RenameCol < ActiveRecord::Migration[7.0]
  def change
    rename_column :creating_meeting_place_requests, :governate_id, :governate
  end
end

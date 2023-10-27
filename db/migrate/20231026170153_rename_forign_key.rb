class RenameForignKey < ActiveRecord::Migration[7.0]
  def change
    rename_column :meeting_places, :supported_governates_id, :governate
  end
end

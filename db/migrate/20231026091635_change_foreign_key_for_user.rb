class ChangeForeignKeyForUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :supported_governates_id, :location
  end
end

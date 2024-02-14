class CreateRequestLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :request_logs do |t|
      t.references :first_side, null: false, foreign_key: { to_table: :users }
      t.references :second_side, null: false, foreign_key: { to_table: :users }
      t.references :first_side_book, null: false, foreign_key: { to_table: :books }
      t.references :second_side_book, null: false, foreign_key: { to_table: :books }
      t.references :meeting_place, null: false, foreign_key: { to_table: :meeting_places }
      t.boolean :first_side_presence
      t.boolean :second_side_presence
      t.datetime :meeting_time

      t.timestamps
    end
  end
end

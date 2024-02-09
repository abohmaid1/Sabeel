class CreateBookRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :book_requests do |t|
      t.references :requester_id, null: false, foreign_key: { to_table: :users }
      t.references :requested_book_id, null: false, foreign_key: { to_table: :user_have_books }
      t.references :meeting_place_id, null: true, foreign_key: { to_table: :meeting_places }
      t.datetime :meeting_time

      t.timestamps
    end
  end
end

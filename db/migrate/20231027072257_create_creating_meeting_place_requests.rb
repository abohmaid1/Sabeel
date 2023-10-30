class CreateCreatingMeetingPlaceRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :creating_meeting_place_requests do |t|
      t.string :email
      t.string :stor_name
      t.string :owner_name
      t.string :city_name
      t.string :location_details
      t.references :governate, index: true, foreign_key: { to_table: :supported_governates }
      t.timestamps
    end
  end
end

class CreateChangeUserTypeRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :change_user_type_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

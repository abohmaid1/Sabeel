class AddStateToBookRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :book_requests, :state, :integer
  end
end

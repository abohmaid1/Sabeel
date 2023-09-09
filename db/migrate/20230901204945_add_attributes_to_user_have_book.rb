class AddAttributesToUserHaveBook < ActiveRecord::Migration[7.0]
  def change
    add_column :user_have_books, :user_rate, :integer
    add_column :user_have_books, :availbe_to_trade, :boolean
  end
end

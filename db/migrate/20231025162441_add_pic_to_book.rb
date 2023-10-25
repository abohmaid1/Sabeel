class AddPicToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :google_book_picture_tag, :string
  end
end

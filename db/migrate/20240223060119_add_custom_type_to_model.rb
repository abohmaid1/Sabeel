class AddCustomTypeToModel < ActiveRecord::Migration[7.0]
  def change
    rename_column :paragraphs, :type, :content_type
  end
end

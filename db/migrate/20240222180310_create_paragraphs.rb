class CreateParagraphs < ActiveRecord::Migration[7.0]
  def change
    create_table :paragraphs do |t|
      t.references :writer, null: false,  foreign_key: { to_table: :users }
      t.text :content
      t.text :type

      t.timestamps
    end
  end
end

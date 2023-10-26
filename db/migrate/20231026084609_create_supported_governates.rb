class CreateSupportedGovernates < ActiveRecord::Migration[7.0]
  def change
    create_table :supported_governates do |t|
      t.string :name
    end
  end
end

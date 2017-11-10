class CreateReleases < ActiveRecord::Migration[5.1]
  def change
    create_table :releases do |t|
      t.references :package
      t.string :key
      t.jsonb :json_data

      t.timestamps
    end
  end
end

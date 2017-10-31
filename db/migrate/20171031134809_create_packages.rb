class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|

      t.string :name
      t.string :source_code_url
      t.integer :total_downloads
      t.integer :score
      t.jsonb :json_data, default: '{}'
      t.jsonb :releases_json, default: '{}'

      t.timestamps
    end
  end
end

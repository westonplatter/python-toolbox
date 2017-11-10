class AddUniqueIndexToReleases < ActiveRecord::Migration[5.1]
  def change
    add_index :releases, [:package_id, :key, :packagetype]
  end
end

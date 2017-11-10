class AddFieldsToReleases < ActiveRecord::Migration[5.1]
  def change
    add_column :releases, :total_downloads, :integer
    add_column :releases, :has_sig, :boolean
    add_column :releases, :upload_time, :datetime
    add_column :releases, :python_version, :string
    add_column :releases, :downloads, :integer
    add_column :releases, :packagetype, :string
    add_column :releases, :size, :integer
  end
end

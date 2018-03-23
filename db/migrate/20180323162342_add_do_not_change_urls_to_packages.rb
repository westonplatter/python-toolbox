class AddDoNotChangeUrlsToPackages < ActiveRecord::Migration[5.1]
  def change
    add_column :packages, :do_not_change_urls, :boolean, default: false
  end
end

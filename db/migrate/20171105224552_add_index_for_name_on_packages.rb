class AddIndexForNameOnPackages < ActiveRecord::Migration[5.1]
  def change
    add_index :packages, :name
  end
end

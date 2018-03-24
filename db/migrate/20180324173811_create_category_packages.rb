class CreateCategoryPackages < ActiveRecord::Migration[5.1]
  def change
    create_table :category_packages do |t|
      t.integer :category_id
      t.integer :package_id

      t.timestamps
    end
  end
end

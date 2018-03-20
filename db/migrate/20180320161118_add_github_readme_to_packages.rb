class AddGithubReadmeToPackages < ActiveRecord::Migration[5.1]
  def change
    add_column :packages, :github_readme, :text
  end
end

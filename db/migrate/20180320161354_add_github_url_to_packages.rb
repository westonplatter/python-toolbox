class AddGithubUrlToPackages < ActiveRecord::Migration[5.1]
  def change
    add_column :packages, :github_url, :string
  end
end

# == Schema Information
#
# Table name: packages
#
#  id                 :integer          not null, primary key
#  name               :string
#  source_code_url    :string
#  total_downloads    :integer
#  score              :integer
#  json_data          :jsonb
#  releases_json      :jsonb
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  github_readme      :text
#  github_url         :string
#  do_not_change_urls :boolean          default(FALSE)
#
# Indexes
#
#  index_packages_on_name  (name)
#

class Package < ApplicationRecord

  has_many :releases, dependent: :destroy
  has_many :category_packages
  has_many :categories, through: :category_packages

  accepts_nested_attributes_for :category_packages,
    reject_if: :all_blank

  #
  # Ransack logic
  #

  def self.descendants_of_category_id(category_id)
    ids = Category.find(category_id).self_and_descendants.collect(&:id)
    joins(:category_packages => [:category]).where("categories.id IN (?)", ids)
  end

  def self.ransackable_scopes(auth_object = nil)
    %i(descendants_of_category_id)
  end

  #
  # rest of model
  #

  def to_param
    name
  end

  def source_code_url_render
    source_code_url.nil? ? "" : source_code_url
  end

  def source_code_url_render_url
    if source_code_url.nil?
      '#'
    else
      source_code_url
    end
  end

  def releases_grouped_by_key_date
    releases.
      select("releases.key").
      select("(select SUM(rr.downloads) FROM releases rr WHERE releases.key = rr.key AND releases.package_id = rr.package_id) AS total_downloads ").
      select("(select MAX(rr.upload_time) FROM releases rr WHERE releases.key = rr.key AND releases.package_id = rr.package_id) AS upload_date ").
      group("releases.package_id", "releases.key").
      order("upload_date DESC NULLS LAST")
  end

  def digest_json_data
    return if do_not_change_urls

    if json_data && JSON.parse(json_data) && JSON.parse(json_data)['home_page']
      url = JSON.parse(json_data)['home_page']

      if url.include?("github.com/") || url.include?("github.com:")

        url = extract_github_url_from_github_ssh_string(url) if url.include?("@")
        url = url.split('#').first if url.include?('#')

        return if source_code_url == url

        self.update_attributes(source_code_url: url, github_url: url)
      end
    end
  end

  def extract_github_url_from_github_ssh_string(string)
    x = string.
      split("@").
      reject {|x| x == "git" }.
      join("").
      gsub(":", "/").
      split(".git").
      join("")

    "https://#{x}"
  end

  def calculate_stats
    total_downloads = total_downloads = releases.sum(:downloads)
    self.update_attributes(total_downloads: total_downloads)
  end

  def digest_json_data_releases(json_data)
    json_releases = JSON.parse(json_data)

    return nil if json_releases.nil?

    json_releases.each do |key, jsons|
      if jsons == []
        Release.find_or_create_by(package_id: self.id, key: key)
      else

        jsons.flat_map do |hash|
          Release.upsert_from_hash(self.id, key, hash)
        end
      end
    end

    return true
  end

  def extract_github_username
    return nil if github_url.nil?
    parts = github_url.split("/")
    index = parts.size-2
    username = parts[index]
  end

  def extract_github_projectname
    return nil if github_url.nil?
    projectname = github_url.split("/").last
  end
end

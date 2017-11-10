class Package < ApplicationRecord

  has_many :releases, dependent: :destroy

  def to_param
    name
  end

  def digest_json_data
    if json_data && JSON.parse(json_data) && JSON.parse(json_data)['home_page']
      if JSON.parse(json_data)['home_page'].include?("github.com")
        home_page = JSON.parse(json_data)['home_page']
        return if source_code_url == home_page
        self.update_attributes(source_code_url: home_page)
      end
    end
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
end

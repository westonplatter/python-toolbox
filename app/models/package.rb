class Package < ApplicationRecord

  has_many :releases, dependent: :destroy

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

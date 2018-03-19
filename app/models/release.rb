# == Schema Information
#
# Table name: releases
#
#  id              :integer          not null, primary key
#  package_id      :integer
#  key             :string
#  json_data       :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  total_downloads :integer
#  has_sig         :boolean
#  upload_time     :datetime
#  python_version  :string
#  downloads       :integer
#  packagetype     :string
#  size            :integer
#

class Release < ApplicationRecord
  belongs_to :package

  def digest_json_data
  end

  def self.upsert_from_hash(package_id, key, hash)
    release = Release.where(
      package_id: package_id, key: key, packagetype: hash['packagetype']
    ).first

    if release.nil?
      create_from_hash(package_id, key, hash)
    else
      update_from_hash(release, hash)
    end
  end

  def self.create_from_hash(package_id, key, hash)
    upload_time = Time.strptime(hash['upload_time'], '%Y-%m-%dT%H:%M:%S')

    params = {
      :package_id => package_id,
      :key => key,
      :has_sig => hash['has_sig'],
      :upload_time => upload_time,
      :python_version => hash['python_version'],
      :downloads => hash['downloads'],
      :packagetype => hash['packagetype'],
      :size => hash['size'],
    }

    return Release.create(params).id
  end

  def self.update_from_hash(release, hash)
    release.update_attributes(downloads: hash['downloads'])
    return release.id
  end
end

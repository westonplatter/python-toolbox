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

require 'rails_helper'

RSpec.describe Release, type: :model do

  def release_json
    "{\"has_sig\":true,\"upload_time\":\"2015-11-24T17:19:47\",\"comment_text\":\"\",\"python_version\":\"py2.py3\",\"url\":\"https://pypi.python.org/packages/cd/1a/9797706779fc77317887bcf4b12632c24aed8404b694ed1b8d1f7053c92b/Django-1.7.11-py2.py3-none-any.whl\",\"md5_digest\":\"9a1e3e2767c5800a9d4e700c4b3aa514\",\"downloads\":119540,\"filename\":\"Django-1.7.11-py2.py3-none-any.whl\",\"packagetype\":\"bdist_wheel\",\"path\":\"cd/1a/9797706779fc77317887bcf4b12632c24aed8404b694ed1b8d1f7053c92b/Django-1.7.11-py2.py3-none-any.whl\",\"size\":7424228}"
  end

  def release_key
    "1.7.11"
  end

  describe "upsert_from_json" do
    it "should create release" do
      package = FactoryGirl.create(:package)

      id = nil

      hash = JSON.parse(release_json)

      expect {
        id = Release.upsert_from_hash(package.id, release_key, hash)
      }.to change {
        Release.count
      }.by(1)

      release = Release.find(id)
      expect(release.python_version).to eq("py2.py3")
      expect(release.downloads).to eq(119540)
    end

    it "should update release" do
      package = FactoryGirl.create(:package)

      hash = JSON.parse(release_json)

      Release.upsert_from_hash(package.id, release_key, hash)

      expect {
        Release.upsert_from_hash(package.id, release_key, hash)
      }.to change {
        Release.count
      }.by(0)
    end
  end
end

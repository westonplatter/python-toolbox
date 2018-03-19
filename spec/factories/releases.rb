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

FactoryGirl.define do
  factory :release do
    package FactoryGirl.create(:package)
  end
end

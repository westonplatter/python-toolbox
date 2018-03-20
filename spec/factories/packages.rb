# == Schema Information
#
# Table name: packages
#
#  id              :integer          not null, primary key
#  name            :string
#  source_code_url :string
#  total_downloads :integer
#  score           :integer
#  json_data       :jsonb
#  releases_json   :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  sequence(:unique_name){|n| "package_name-#{n}" }

  factory :package do
    name { generate(:unique_name) }

    github_url "https://github.com/x/y/"
  end
end

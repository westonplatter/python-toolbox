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

require 'rails_helper'

RSpec.describe Package, type: :model do
  describe "factory" do
    it "works" do
      expect { FactoryGirl.create(:package) }.to change{ Package.count }.by(1)
    end
  end
end

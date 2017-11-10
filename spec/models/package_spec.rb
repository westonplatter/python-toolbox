require 'rails_helper'

RSpec.describe Package, type: :model do
  describe "factory" do
    it "works" do
      expect { FactoryGirl.create(:package) }.to change{ Package.count }.by(1)
    end
  end
end

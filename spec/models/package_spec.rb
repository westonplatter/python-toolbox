require 'rails_helper'

RSpec.describe Package, type: :model do
  describe "factory" do
    it "works" do
      expect { FactoryGirl.create(:package) }.to change{ Package.count }.by(1)
    end
  end

  describe "github url opterations" do
    it "should extract github username" do
      package = FactoryGirl.create(:package)
      expect(package.extract_github_username).to eq("x")
    end

    it "should extract github projectname" do
      package = FactoryGirl.create(:package)
      expect(package.extract_github_projectname).to eq("y")
    end
  end
end

require "rails"

describe "Package UI", type: :feature, js: true do

  describe "index" do
    it "should render with no packages" do
      visit_and_confirm("/packages")
    end

    it "should render with objects" do
      package = FactoryGirl.create(:package, total_downloads: 100)
      package = FactoryGirl.create(:package, total_downloads: 200)

      visit_and_confirm("/packages")
    end
  end

  describe "show" do
    it 'should render' do
      package = FactoryGirl.create(:package, total_downloads: 100)
      visit_and_confirm("/packages/#{package.name}")
    end
  end

  describe "edit" do
    it "should render" do
      package = FactoryGirl.create(:package)
      visit_and_confirm("/packages/#{package.name}/edit")
    end
  end
end

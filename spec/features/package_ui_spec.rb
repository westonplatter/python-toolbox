require "rails"

describe "Package UI", type: :feature, js: true do

  describe "index page ui" do
    it "should render" do
      visit_and_confirm("/packages")
    end
  end

  describe "show page ui" do
    it 'should render' do
      FactoryGirl.create(:package, total_downloads: 100)
      FactoryGirl.create(:package, total_downloads: 200)
    end
  end

end

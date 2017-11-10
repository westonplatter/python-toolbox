require "rails"

describe "Package UI", js: true do
  describe "index page ui" do
    it "should render" do
      visit_and_confirm("/packages")
    end
  end
end

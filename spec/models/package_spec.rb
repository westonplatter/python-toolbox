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


    describe "should extract github url" do

      it "from github ssh connection" do
        package = FactoryGirl.build(:package)
        string = "git@github.com:westonplatter/python-toolbox"
        result = package.extract_github_url_from_github_ssh_string(string)
        expect(result).to eq("https://github.com/westonplatter/python-toolbox")
      end

      it "from github ssh connection with .git" do
        package = FactoryGirl.build(:package)
        string = "git@github.com:westonplatter/python-toolbox.git"
        result = package.extract_github_url_from_github_ssh_string(string)
        expect(result).to eq("https://github.com/westonplatter/python-toolbox")
      end

    end
  end

end

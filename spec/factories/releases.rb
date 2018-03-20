FactoryGirl.define do
  factory :release do
    package FactoryGirl.create(:package)
  end
end

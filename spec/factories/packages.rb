FactoryGirl.define do
  sequence(:unique_name){|n| "package_name-#{n}" }

  factory :package do
    name { generate(:unique_name) }

    github_url "https://github.com/x/y/"
  end
end

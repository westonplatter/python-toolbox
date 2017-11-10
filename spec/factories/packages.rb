FactoryGirl.define do
  sequence(:unique_name){|n| "package_name-#{n}" }

  factory :package do
    name { generate(:unique_name) }
  end
end

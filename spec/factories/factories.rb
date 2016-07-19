FactoryGirl.define do

  factory :merchant do
    name { generate(:merchant_name) }
  end

  sequence :merchant_name do |n|
    "merchant-#{n}"
  end
end

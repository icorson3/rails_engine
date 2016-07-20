FactoryGirl.define do

  factory :merchant do
    name { generate(:merchant_name) }
  end

  sequence :merchant_name do |n|
    "merchant-#{n}"
  end

  factory :item do
    name { generate :item_name }
    merchant
  end

  sequence :item_name do |n|
    "item-#{n}"
  end

  factory :invoice do
    status "pending"
    merchant
    customer
    created_at "2016-01-01 00:00:00"
    updated_at "2016-01-01 00:00:00"
  end

  factory :customer do
    first_name "bob"
    last_name "shithead"
  end

  factory :invoice_item do
    invoice
    item
    quantity 10
    unit_price "1005"
    created_at "2016-01-01 00:00:00"
    updated_at "2016-01-01 00:00:00"
  end
end

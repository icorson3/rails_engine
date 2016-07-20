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
  end

  factory :customer do
    first_name { generate :customer_first_name }
    last_name { generate :customer_last_name }
  end

  sequence :customer_first_name do |n|
    "customer-#{n}"
  end

  sequence :customer_last_name do |n|
    "customer-#{n}"
  end

  factory :invoice_item do
    invoice
    item
    quantity 10
    unit_price "1000"
  end

  factory :transaction do
    credit_card_number { generate :numbers }
    result "success"
    invoice
  end

  sequence :numbers do |n|
    "transaction-#{n}"
  end
end

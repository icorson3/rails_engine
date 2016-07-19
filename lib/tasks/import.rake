require 'csv'

namespace :import do
  desc "import merchants data from csv"
  task merchants: :environment do
    filename = File.join Rails.root, "data/merchants.csv"

    CSV.foreach(filename, headers: true) do |row|
      merchant = Merchant.create(name: row["name"], created_at: row["created_at"], updated_at: row["updated_at"])
    end
  end

  desc "import transactions data from csv"
  task transactions: :environment do
    filename = File.join Rails.root, "data/transactions.csv"

    CSV.foreach(filename, headers: true) do |row|
      merchant = Transaction.create(invoice_id: row["invoice_id"], credit_card_number: row["credit_card_number"], result: row["result"], created_at: row["created_at"], updated_at: row["updated_at"])
    end
  end

  desc "import customers data from csv"
  task customers: :environment do
    filename = File.join Rails.root, "data/customers.csv"

    CSV.foreach(filename, headers: true) do |row|
      customer = Customer.create(first_name: row["first_name"], last_name: row["last_name"], created_at: row["created_at"], updated_at: row["updated_at"])
    end
  end
end

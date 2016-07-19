require 'csv'

namespace :import do
  desc "import merchants data from csv"
  task merchants: :environment do
    filename = File.join Rails.root, "data/merchants.csv"

    CSV.foreach(filename, headers: true) do |row|
      merchant = Merchant.create(name: row["name"], created_at: row["created_at"], updated_at: row["updated_at"])
    end
  end

  desc "import invoices data from csv"
  task invoices: :environment do
    filename = File.join Rails.root, "data/invoices.csv"

    CSV.foreach(filename, headers: true) do |row|
      invoice = Invoice.create(customer_id: row["customer_id"], merchant_id: row["merchant_id"], status: row["status"], created_at: row["created_at"], updated_at: row["updated_at"])

    end
  end

  desc "import transactions data from csv"
  task transactions: :environment do
    filename = File.join Rails.root, "data/transactions.csv"
    CSV.foreach(filename, headers: true) do |row|
      merchant = Transaction.create(invoice_id: row["invoice_id"], credit_card_number: row["credit_card_number"], result: row["result"], created_at: row["created_at"], updated_at: row["updated_at"])
    end
  end

  desc "import items data from csv"
  task items: :environment do
    filename = File.join Rails.root, "data/items.csv"
    CSV.foreach(filename, headers: true) do |row|
      merchant = Item.create(name: row["name"], description: row["description"], unit_price: row["unit_price"], merchant_id: row["merchant_id"], created_at: row["created_at"], updated_at: row["updated_at"])
    end
  end

end

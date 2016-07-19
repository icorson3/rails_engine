require 'csv'

namespace :import do
  desc "import merchants data from csv"
  task merchants: :environment do
    filename = File.join Rails.root, "data/merchants.csv"

    CSV.foreach(filename, headers: true) do |row|
      merchant = Merchant.create(name: row["name"], created_at: row["created_at"], updated_at: row["updated_at"])
    end
  end

  task invoices: :environment do
    filename = File.join Rails.root, "data/invoices.csv"

    CSV.foreach(filename, headers: true) do |row|
      invoice = Invoice.create(customer_id: row["customer_id"], merchant_id: row["merchant_id"], status: row["status"], created_at: row["created_at"], updated_at: row["updated_at"])
    end
  end
end

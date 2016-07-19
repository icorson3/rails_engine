require 'csv'

namespace :import do
  desc "import merchants data from csv"
  task merchants: :environment do
    filename = File.join Rails.root, "data/merchants.csv"

    CSV.foreach(filename, headers: true) do |row|
      merchant = Merchant.create(row.to_h)
    end
  end

  desc "import invoices data from csv"
  task invoices: :environment do
    filename = File.join Rails.root, "data/invoices.csv"

    CSV.foreach(filename, headers: true) do |row|
      invoice = Invoice.create(row.to_h)

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
      merchant = Item.create(row.to_h)
    end
  end


  desc "import customers data from csv"
  task customers: :environment do
    filename = File.join Rails.root, "data/customers.csv"

    CSV.foreach(filename, headers: true) do |row|
      customer = Customer.create(row.to_h)
    end
  end

  desc "import invoice_items data from csv"
  task invoice_items: :environment do
    filename = File.join Rails.root, "data/invoice_items.csv"

    CSV.foreach(filename, headers: true) do |row|
      invoice_item = InvoiceItem.create(row.to_h)
    end
  end

  desc "import all data from csvs"
  task all: :environment do
    Rake::Task['import:merchants'].execute
    Rake::Task['import:customers'].execute
    Rake::Task['import:invoices'].execute
    Rake::Task['import:items'].execute
    Rake::Task['import:invoice_items'].execute
    Rake::Task['import:transactions'].execute
  end
end

require 'csv'

namespace :import do
  desc "import merchants data from csv"
  task merchants: :environment do
    filename = File.join Rails.root, "data/merchants.csv"

    CSV.foreach(filename, headers: true) do |row|
      merchant = Merchant.create(name: row["name"], created_at: row["created_at"], updated_at: row["updated_at"])
    end
  end
end

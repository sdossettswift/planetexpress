require 'csv'
require 'pp'
require 'erb'

shipments = []
# Counter for Shipments
leela_shipments = 0
bender_shipments = 0
fry_shipments = 0
amy_shipments =0

leela_revenue = 0
bender_revenue = 0
fry_revenue = 0
amy_revenue = 0
total_revenue = 0

leela_bonus = 0
bender_bonus = 0
fry_bonus = 0
amy_bonus = 0


best_seller = 0
employee_of_the_week = 0
best_customer = 0


CSV.foreach('planet_express_logs.csv', headers: true) do |row|
  shipment_as_hash = row.to_hash
  shipments << shipment_as_hash

  case shipment_as_hash ["Destination"]
  when "Earth"
    fry_shipments +=1
    fry_revenue += shipment_as_hash ["Money"].to_i

  when "Mars"
    amy_shipments +=1
    amy_revenue += shipment_as_hash ["Money"].to_i

  when "Uranus"
    bender_shipments +=1
    bender_revenue += shipment_as_hash ["Money"].to_i
  else
    leela_shipments +=1
    leela_revenue += shipment_as_hash ["Money"].to_i
  end
end
    puts "Fry shipped #{fry_shipments}."
    puts "Fry brought in $#{fry_revenue}."
    puts " "
    puts "Amy shipped #{amy_shipments}."
    puts "Amy brought in $ #{amy_revenue}."
    puts " "
    puts "Bender shipped #{bender_shipments}."
    puts "Bender brought in $ #{bender_revenue}."
    puts " "
    puts "Leela shipped #{leela_shipments}."
    puts "Leela brought in $ #{leela_revenue}."


erb = File.read("report.erb")
html= ERB.new(erb).result(binding)
File.open("index.html", "wb") {|file| file << html}

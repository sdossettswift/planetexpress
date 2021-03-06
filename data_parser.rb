require 'csv' #to work with CSV files
require 'pp'  #pretty print
require 'erb' #embedded ruby

def as_money(number)
   sprintf("$%.2f", number).reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse
end # format number as money

shipment_as_hash = []

fry_shipments = 0
fry_revenue = 0
amy_shipments = 0
amy_revenue = 0
bender_shipments = 0
bender_revenue = 0
leela_shipments = 0
leela_revenue = 0

earth_revenue = 0
mars_revenue = 0
uranus_revenue = 0
moon_revenue=0
jupiter_revenue=0
pluto_revenue=0
saturn_revenue=0
mercury_revenue=0

CSV.foreach('planet_express_logs.csv', headers: true) do |row|
  shipment = row.to_hash
  shipment_as_hash << shipment
  case shipment["Destination"]
    when "Earth"
      shipment["Pilot"] = "Fry"
      fry_shipments += 1
      fry_revenue += shipment["Money"].to_i
      earth_revenue += shipment["Money"].to_i
    when "Mars"
      shipment["Pilot"] = "Amy"
      amy_shipments += 1
      amy_revenue += shipment["Money"].to_i
      mars_revenue =+ shipment["Money"].to_i
    when "Uranus"
      shipment["Pilot"] = "Bender"
      bender_shipments += 1
      bender_revenue += shipment["Money"].to_i
      uranus_revenue += shipment["Money"].to_i
    when "Moon"
      shipment["Pilot"] = "Leela"
      leela_shipments += 1
      leela_revenue += shipment["Money"].to_i
      moon_revenue += shipment["Money"].to_i
    when "Mercury"
      shipment["Pilot"] = "Leela"
      leela_shipments += 1
      leela_revenue += shipment["Money"].to_i
      mercury_revenue += shipment["Money"].to_i
    when "Jupiter"
      shipment["Pilot"] = "Leela"
      leela_shipments += 1
      leela_revenue += shipment["Money"].to_i
      jupiter_revenue += shipment["Money"].to_i
    when "Saturn"
      shipment["Pilot"] = "Leela"
      leela_shipments += 1
      leela_revenue += shipment["Money"].to_i
      saturn_revenue += shipment["Money"].to_i
    when "Pluto"
      shipment["Pilot"] = "Leela"
      leela_shipments += 1
      leela_revenue += shipment["Money"].to_i
      pluto_revenue += shipment["Money"].to_i
  end
end

  fry_bonus =  as_money((fry_revenue.to_i * 0.1))
  leela_bonus = as_money((leela_revenue.to_i * 0.1))
  amy_bonus = as_money((amy_revenue.to_i * 0.1))
  bender_bonus = as_money((bender_revenue.to_i * 0.1))

earth_revenue = as_money(earth_revenue)
moon_revenue = as_money(moon_revenue)
mars_revenue = as_money(mars_revenue)
uranus_revenue = as_money(uranus_revenue)
jupiter_revenue = as_money(jupiter_revenue)
saturn_revenue = as_money(saturn_revenue)
mercury_revenue = as_money(mercury_revenue)
pluto_revenue = as_money(pluto_revenue)



    puts "Fry shipped #{fry_shipments}."
    puts "Fry brought in #{fry_revenue}."
    puts "Fry earned a #{fry_bonus} bonus"
    puts " "
    puts "Amy shipped #{amy_shipments}."
    puts "Amy brought in #{amy_revenue}."
    puts "Amy earned a #{amy_bonus} bonus"
    puts " "
    puts "Bender shipped #{bender_shipments}."
    puts "Bender brought in #{bender_revenue}."
    puts "Bender earned a #{bender_bonus} bonus."
    puts " "
    puts "Leela shipped #{leela_shipments}."
    puts "Leela brought in #{leela_revenue}."
    puts "Leela earned a #{leela_bonus} bonus."

    puts "Earth: #{earth_revenue}"
    puts "Moon: #{moon_revenue}"
    puts "Mars: #{mars_revenue}"
    puts "Uranus: #{uranus_revenue}"
    puts "Jupiter: #{jupiter_revenue}"
    puts "Saturn: #{saturn_revenue}"
    puts "Mercury: #{mercury_revenue}"
    puts "Pluto: #{pluto_revenue}"

total_revenue = as_money(leela_revenue + fry_revenue + bender_revenue + amy_revenue)


erb = File.read("report.erb")
html= ERB.new(erb).result(binding)
File.open("index.html", "wb") {|file| file << html}

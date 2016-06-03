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
    puts "Amy shipped #{amy_shipments}."
    puts "Bender shipped #{bender_shipments}."
    puts "Leela shipped #{leela_shipments}."


    puts "Fry brought in $#{fry_revenue}."
    puts "Amy brought in $ #{amy_revenue}."
    puts "Bender brought in $ #{bender_revenue}."
    puts "Leela brought in $ #{leela_revenue}."
# CSV.foreach("data.csv", headers: true) do |row|

#   hash = row.to_hash
#   who_gets_to_use = hash["In a row of three seats, who should get to use the two arm rests?"]
#
#   case who_gets_to_use
#   when "The arm rests should be shared"
#     shared += 1
#   when "Whoever puts their arm on the arm rest first"
#     dibs += 1
#   when "The person in the middle seat gets both arm rests"
#     middle += 1
#   when "Other (please specify)"
#     other += 1
#   when "The people in the aisle and window seats get both arm rests"
#     suckit_middle_seat += 1
#   else
#     not_answered += 1
#   end
#   # answers.push who_gets_to_use.inspect
# end


# Destination,Shipment,Crates,Money
# Earth,Hamburgers,150,30000
# Moon,Tacos,33,44500
# Earth,Movies,34,5000
# Mars,BBQ Sauce,999,15000
# Uranus,Whiskey,1000,345600
# Jupiter,Books,10,3451
# Pluto,Beer,100,2344
# Uranus,Pizza,66,10000
# Saturn,Pizza,26,1000
# Mercury,Pizza,36,80000

erb = File.read("report.erb")
html= ERB.new(erb).result(binding)
File.open("index.html", "wb") {|file| file << html}

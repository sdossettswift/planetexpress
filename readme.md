Creating an HTML Report from parsing CSV, including a Chart.

Objectives

Learning Objectives

After completing this assignment, you should…

Understand data design
Deeply understand ruby styles, variables, and loops
Performance Objectives

After completing this assignment, you be able to effectively use

ruby on the command line
data, erb
comma seperated values (CSV)
Charts
Details

Deliverables

A link to a github repository with at least the following:
planet_express_logs.csv
data_parser.rb
report.erb
styles.css

Requirements

I should be able to run ruby data_parser.rb and have report.html generated
The HTML file should have some styles, use normalize
The HTML should have a pie chart using Google charts, like so:
chart

Optional Ideas
Use Bootstrap to style your report
Use SASS locally
Normal Mode

Good news Rubyists!
We have a week of records tracking what we shipped at Planet Express. I need you to answer a few questions for Hermes.

How much money did we make this week?
How much of a bonus did each employee get? (bonuses are paid to employees who pilot the Planet Express)
How many trips did each employee pilot?
Different employees have favorite destinations they always pilot to

Fry - pilots to Earth (because he isn't allowed into space)
Amy - pilots to Mars (so she can visit her family)
Bender - pilots to Uranus (teeheee...)
Leela - pilots everywhere else because she is the only responsible one
They get a bonus of 10% of the money for the shipment as the bonus

And so: We need sections on the HTML with:

h1 with the total money we made this week
List of all Shipments (create a table with the shipments listed)
List of all employees and their number of trips and bonus
Pie chart of the Money each employee delivered
A gif, preferably related to Fry, Amy, Bender, and/or Leela
Difficult Mode

How much money did we make broken down by planet? ie.. how much did we make shipping to Earth? Mars? Saturn? etc.
Epic Mode

No methods can be longer than 10 lines long
Define a class "Parse", with a method parse_data, with an argument file_name
Make data_parser.rb executable with a command line argument of the file name
./data_parser.rb planet_express_logs.csv > report.html

Notes

File name: planet_express_logs.csv

Destination,Shipment,Crates,Money
Earth,Hamburgers,150,30000
Moon,Tacos,33,44500
Earth,Movies,34,5000
Mars,BBQ Sauce,999,15000
Uranus,Whiskey,1000,345600
Jupiter,Books,10,3451
Pluto,Beer,100,2344
Uranus,Pizza,66,10000
Saturn,Pizza,26,1000
Mercury,Pizza,36,80000
sample ruby code

require 'csv'
CSV.foreach("planet_express_logs.csv", headers: true) do |row|
  puts row.inspect # replace with your logic
end

sample code to create an HTML file from a template.erb

html_string = File.read("template.erb")
compiled_html = ERB.new(html_string).result(binding)
File.open("./index-output.html", "wb") {|file|
    file.write(compiled_html)
    file.close()
}
Additional Resources

Google Chart Docs
JS Fiddle of working Google Chart
ERB Docs
Read http://www.nostarch.com/rubywizardry if you feel lost on Ruby basics
CSV documentation

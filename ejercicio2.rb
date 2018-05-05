names = ["Violeta", "Andino", "Clemente", "Javiera", "Paula", "Pia", "Ray"]
puts "Arreglo inicial"
puts names.inspect

puts "1.- **********"
b = names.select{|e| e.length > 5}
puts b.inspect

puts "2.- **********"
c = names.map{|e| e.downcase}
puts c.inspect

puts "3.- **********"
d = names.select{|e| e[0].upcase == "P"}
puts d.inspect

puts "4.- **********"
f = names.map{|e| e.length}
puts f.inspect

puts "5.- **********"
g = names.map{|e| e.gsub(/([AEIOUaeiou])/,"")}
puts g.inspect
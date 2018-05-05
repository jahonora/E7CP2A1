a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]
puts "Arreglo inicial"
puts a.inspect

puts "1.- **********"
b = a.map{|e| e + 1}
puts b.inspect

puts "2.- **********"
c = a.map{|e| e.to_f}
puts c.inspect

puts "3.- **********"
d = a.map{|e| e.to_s}
puts d.inspect

puts "4.- **********"
f = a.reject{|e| e < 5}
puts f.inspect

puts "5.- **********"
g = a.select{|e| e < 5}
puts g.inspect

puts "6.- **********"
h = a.inject(0){|sum, e| sum += e}
puts h.inspect

puts "7.- **********"
j = a.group_by{|e| e.odd?}
puts j

puts "8.- **********"
k = a.group_by{|e| e < 6}
puts k


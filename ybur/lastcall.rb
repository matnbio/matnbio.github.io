require 'date'






inicio = Date.new(2006,1,1)
final = Date.new(2006,12,31)

(inicio..final).each do |day|
  puts day
end

eldict = {inicio => [1,2016]}
puts eldict[inicio].inspect

d = Date.new(2001,2,3)
puts d.strftime('%a %d %b %Y')
puts get_epiweek(d)
e = d+1
puts e.strftime('%a %d %b %Y')
puts get_epiweek(e)

dates = []

inicio = 2010
(inicio..inicio+7).each { |y|
  dates << Date.new(y,1,1)
}

dates.each {|d|
  puts firstweek?(d)
}


hoy = Date.new(2017,05,15)
puts hoy.strftime('%a %d %b %Y')
elsab = nextsat(hoy)
puts elsab.strftime('%a %d %b %Y')

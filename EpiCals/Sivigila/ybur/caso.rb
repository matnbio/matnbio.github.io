require 'roo-xls'

xls = Roo::Spreadsheet.open('../data/2014.xls')
puts xls.info

h1 = xls.sheet(0)
h1.each(sem: 'semana', not: 'fec_not') do |data|
  puts data[:not] if data[:not] != 'fec_not'
end


=begin

Leer archivo (nombre archivo)
leer fecha notificacion
calcular semana epidemiologic
contar cantidad de fechas contradictorias por año
retornar
Año-> semana, casos
=end

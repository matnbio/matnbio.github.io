require 'roo'
#require 'roo-xls'

#file = Roo::Spreadsheet.open('CasosNeiva.xlsx')
file = Roo::Spreadsheet.open('../DatosBello/DengueBello2014.xls', extension: :xlsx)
file.info


#h1 = file.sheet(0)
#h1.each(sem: 'semana', not: 'fec_not') do |data|
#  puts data[:not] if data[:not] != 'fec_not'
#end


=begin

Leer archivo (nombre archivo)
leer fecha notificacion
calcular semana epidemiologic
contar cantidad de fechas contradictorias por año
retornar
Año-> semana, casos
=end

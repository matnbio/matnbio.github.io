require 'roo'
require 'roo-xls'
require 'date'

class Caso
  def initialize(date)
  end
end

def last_epi_week(date)

end

def first_epi_week?(date)
  date.mday >= 4
end

def next_sat(date)
  while date.cwday != 6 do date+=1 end
  date
end

def next_week(date)
  date+7
end

def get_epi_week(thedate)
  week = 0
  thisSat = next_sat(Date.new(thedate.year,1,1))
  if first_epi_week?(thisSat)
    week = 1
  elsif thisSat<thedate
    Date.new(thedate.year-1,12,31)
  else
    thisSat = next_week(thisSat)
    week += 1
  end
  while thisSat<thedate
    thisSat = next_week(thisSat)
    week+=1
  end
  week
end

################################################################################

file = Roo::Spreadsheet.open('../Datos/CasosPrueba.xlsx')
#file = Roo::Spreadsheet.open('../Datos/Neiva/CasosNeiva.xlsx')
#file = Roo::Spreadsheet.open('../DatosBello/DengueBello2014.xls', extension: :xlsx)

h1 = file.sheet(file.sheets.last)
#casos = 0
h1.each(semana: 'semana', inicio: 'ini_sin_') do |data|
  #casos += 1
  #break if casos > 10
  unless (data[:inicio] == 'ini_sin_')
    fecha = data[:inicio]
    puts fecha
    puts get_epi_week(fecha)
  end

end

################################################################################

#
# dates = []
# inicio = 2017
# (inicio..inicio+0).each { |y|
#   dates << Date.new(y,1,1)
# }
#
# dates.each {|d|
#   #puts d
#   puts get_epi_week(d)
# }

=begin

Leer archivo (nombre archivo)
leer fecha notificacion
calcular semana epidemiologic
contar cantidad de fechas contradictorias por año
retornar
Año-> semana, casos
=end

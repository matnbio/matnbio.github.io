require 'date'
require 'roo'
require 'roo-xls'

def last_week_year(date)  # devuelve la ultima semana epidemiologica de ese año.
  get_epi_week(Date.new(date.year-1,12,31))
end

def first_epi_week?(date)
  date.mon == 1 && date.mday >= 4 && date.mday <=7
end

def next_week(date)
  date+7
end

def next_sat(date)
  while date.cwday != 6 do date+=1 end
  date
end

def get_epi_week(thedate)
  week = 0
  thisSat = next_sat(Date.new(thedate.year,1,1))
  if thedate<=thisSat
    last_week_year(thedate)
  elsif first_epi_week?(thisSat)
    week = 1
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


file = Roo::Spreadsheet.open('../Datos/CasosPrueba.xlsx')
h1 = file.sheet(file.sheets.last)
h1.each(semana: 'semana', inicio: 'ini_sin_') do |data|
  unless (data[:inicio] == 'ini_sin_')
    fecha = data[:inicio]
    puts fecha
    puts get_epi_week(fecha)
  end
end

# current_year = 2006
# current_week = 1
# puts ("fecha: #{primera_fecha} semana:#{current_week} año:#{current_year}")
# puts next_sat(primera_fecha)

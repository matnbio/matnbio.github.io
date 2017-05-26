require 'date'
require 'roo'
require 'roo-xls'

def last_week_year(date)  # devuelve la ultima semana epidemiologica de ese año.
  newdate = Date.new(date.year-1) unless (date.mon==12)
  #puts first_epi_week(newdate.year)
  dias = (date-first_epi_week(newdate.year)).to_i
  #puts dias
  (dias/7)+1
end

def first_epi_week(year)
  first_sat = next_sat(Date.new(year,1,1))
  unless first_epi_week?(first_sat)
    first_sat = next_week(first_sat)
  end
  first_sat
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
  thisSat = next_sat(thedate)
  #puts thisSat
  if first_epi_week?(thisSat)
    last_week_year(thedate)
  elsif thisSat < first_epi_week(thedate.year)
    last_week_year(thisSat)
  else
    week = 1
    thisSat = first_epi_week(thedate.year)
    while thedate > thisSat
      thisSat = next_week(thisSat)
      week+=1
    end
    week
  end
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

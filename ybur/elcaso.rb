require 'date'

class Caso
  def initialize(date)
  end
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
  first_sat = next_sat(Date.new(thedate.year,1,1))
  first_epi_week?(first_sat) ? week = 1 : week = next_week(first_sat)
  if thedate < thisSat

end

dates = []
inicio = 2017
(inicio..inicio+0).each { |y|
  dates << Date.new(y,1,1)
}

dates.each {|d|
  #puts d
  puts get_epi_week(d)
}

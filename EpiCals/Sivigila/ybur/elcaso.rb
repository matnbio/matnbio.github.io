require 'date'

class Caso
  def initialize(date)
  end
end

def first_epi_week?(date)
  date.cwday == 7 or date.cwday < 4
end

def next_sat(date)
  date+=1 until date.cwday == 6
  date
end

def next_week(date)
  date+7
end

def get_epi_week(thedate)
  first_sat = next_sat(Date.new(thedate.year,1,1))
  puts first_sat
  puts first_epi_week?(first_sat)
  next_week(first_sat)
end

dates = []
inicio = 2017
(inicio..inicio+0).each { |y|
  dates << Date.new(y,1,1)
}

dates.each {|d|
  puts get_epi_week(d)
}

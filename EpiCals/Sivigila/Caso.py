# -*- coding: utf-8 -*-
import xlrd
import datetime
from datetime import timedelta

class Caso:

    def p_case(self):
        print ("IS: {}, Y: {}, W: {}").format(self.inisin,self.year,self.week)

    def __init__(self,id,inisin,week,year):
        self.id = id
        self.week = week
        self.year = year
        self.inisin = datetime.date(inisin[0],inisin[1],inisin[2])

    def get_epiweek(self):
        aday = timedelta(days=1)
        theday = datetime.date(self.inisin.year,1,1)
        if(theday.weekday<=1):thisweek=1
        else: thisweek = 0
        while(theday<=self.inisin):
            if(theday.weekday()>5): thisweek+=1
            theday += aday
        return thisweek

book = xlrd.open_workbook('data/Dengue Bello 2014.xls')
sh = book.sheet_by_index(0)

cases = {}
wrong = {}



def add_to_cases(c):
    if (c.year not in cases): cases[c.year] = []
    cases[c.year].append(c)

def is_correct(c):
    if(c.inisin.year()== year and get_epiweek(c)== week):
         return True
    return False

def print_cases():
    for i in cases:
        #print i
        for j in cases[i]:
            j.p_case()
            print j.get_epiweek()

# Comienza Ejecución

for i in range(1,11):
    inisin = xlrd.xldate_as_tuple((sh.cell_value(rowx=i, colx=37)),0)
    week = sh.cell_value(rowx=i, colx=2)
    year = sh.cell_value(rowx=i, colx=3)
    #print(inisin,week,year)
    elcaso = Caso(i,inisin,week,year)
    add_to_cases(elcaso)

print_cases()

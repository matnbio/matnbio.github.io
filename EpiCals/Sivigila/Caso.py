# -*- coding: utf-8 -*-
import xlrd
import datetime as dt

class Caso:
    def __init__(self,id,inisin,week,year):
        self.id = id
        self.week = week
        self.year = year
        self.inisin = inisin

    def p_case(self):
        print ("IS: {}, Y: {}, W: {}").format(self.inisin,self.year,self.week)

book = xlrd.open_workbook('data/Dengue Bello 2014.xls')
sh = book.sheet_by_index(0)

cases = {}
D = {}

def get_epiweek(case):
    theday = datetime.date(case.year,1,1)
    if(theday.weekday<=1):thisweek=1
    else: thisweek = 0
    while(theday<=datetime.date(case.year,case.month,case.day)):
        if(theday.weekday()>5): thisweek+=1
        theday += aday
    return thisweek

def add_to_cases(c):
    if (c.year not in cases): cases[c.year] = []
    cases[c.year].append(c)


def is_correct(c):
    if(c.inisin.year()== year and get_epiweek(c)== week):
         return True
    return False

def print_cases():
    for i in cases:
        print i
        for j in cases[i]:
            j.p_case()

for i in range(1,11):
    a = xlrd.xldate_as_tuple((sh.cell_value(rowx=i, colx=37)),0)
    b = sh.cell_value(rowx=i, colx=2)
    c = sh.cell_value(rowx=i, colx=3)

    c = Caso(i,a,b,c)
    add_to_cases(c)

print_cases()

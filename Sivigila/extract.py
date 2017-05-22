
# -*- coding: utf-8 -*-

#from openpyxl import load_workbook as lwb

#wb = lwb(filename = 'data/Dengue Bello 2015_hasta semana 09.xls')
#print wb.get_sheet_names()

import xlrd
import datetime as dt

#book = xlrd.open_workbook('data/Dengue Bello 2015_hasta semana 09.xls')
book = xlrd.open_workbook('data/Dengue Bello 2014.xls')

#print("The number of worksheets is {0}".format(book.nsheets))
#print("Worksheet name(s): {0}".format(book.sheet_names()))
sh = book.sheet_by_index(0)
#print("{0} {1} {2}".format(sh.name, sh.nrows, sh.ncols))
for i in range(1,11):
    #print(book.datemode)
    a = (("Inicio sintomas: {}").format(xlrd.xldate_as_tuple((sh.cell_value(rowx=i, colx=37)),0)))
    b = ("semana: {}").format(sh.cell_value(rowx=i, colx=2))
    c = ("año: {}").format(sh.cell_value(rowx=i, colx=3))

    print a,b,c

#for rx in range(sh.nrows):
#    print(sh.row(rx))
